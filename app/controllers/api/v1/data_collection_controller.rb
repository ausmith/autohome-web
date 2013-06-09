#require 'secure_random'
module Api
  module V1
    class DataCollectionController < ApplicationController
      skip_before_filter :authenticate_user!
      #protect_from_forgery :except => [:online, :report]
      skip_before_filter :verify_authenticity_token
      respond_to :json

      # Notify Autohome that this node is now online
      # @method POST
      # @params mac_address
      # @params initialization_key
      # @return 403 on failure (result --> status_code JSON)
      # @return 200 on success (result --> [status_code, new_initialization_key, one_time_key] JSON)
      def online
        # Grab params
        mac = params[:mac_address]
        initialization_key = params[:initialization_key]

        # Fetch the node if it exists
        node = Node.find_by_mac_address(mac)
        node_nil = node == nil
        key_valid = !node_nil && initialization_key == node.initialization_key

        puts key_valid
        puts node_nil

        # Build the result hash to display
        @result = Hash.new
        @result['result'] = Hash.new

        if key_valid
          # Everything looks good; create a new initialization key and one-time key.
          @result['result']['status_code'] = 0
          node.update_initialization_key
          node.update_one_time_key

          if !node.valid? || !node.save!
            # Something we generated was not valid. Set the status code to 2
            @result['result']['status_code'] = 2
          else
            @result['result']['new_initialization_key'] = node.initialization_key
            @result['result']['new_one_time_key'] = node.one_time_key
          end
        else
          # Everything is not okay; status code > 0
          @result['result']['status_code'] = 1
        end

        respond_to do |format|
          if node == nil || @result['result']['status_code'] != 0
            format.json { render json: @result, status: :forbidden }
            format.text { render :status => :forbidden, :content_type => Mime::TEXT }
          else
            format.json { render json: @result }
            format.text { render :content_type => Mime::TEXT }
          end
        end
      end

      def report
        mac = params[:mac_address]
        key = params[:one_time_key]

        # Fetch the node if it exists
        node = Node.find_by_mac_address(mac)
        node_nil = node == nil
        key_valid = !node_nil && key == node.one_time_key

        Node.transaction do
          # Build the result hash to display
          @result = Hash.new
          @result['result'] = Hash.new

          if key_valid
            # All good so far. Start reading in data and storing it.
            @result['result']['status_code'] = 0
            node.update_one_time_key

            # Start reading in the pins and the values
            have_pin = true
            current_pin_number = 0
            sensor_success = true
            Sensor.transaction do
              begin
                current_pin_location = params["pin_#{current_pin_number}_location"]
                current_pin_value  = params["pin_#{current_pin_number}_value"]

                if current_pin_location != nil && current_pin_value != nil
                  # Get the sensor that this value applies to
                  sensor = Sensor.where(:node_id => node, :starting_pin => current_pin_location.to_i).first

                  if sensor
                    # Craft a data point with the provided information
                    data_point = DataPoint.new
                    data_point.node = node
                    data_point.sensor = sensor
                    data_point.value = current_pin_value

                    if !(data_point.valid? && data_point.save)
                      @result['result']['status_code'] = 4 # Sensor data could not save
                      sensor_success = false
                      raise ActiveRecord::Rollback
                    end
                  else
                    # Problem -- sensor does not exist
                    @result['result']['status_code'] = 3 # Invalid Sensor
                    sensor_success = false
                    raise ActiveRecord::Rollback
                  end
                else
                  have_pin = false
                end

                current_pin_number += 1
              end while have_pin
            end # Sensor transaction

            if sensor_success # Did all the sensors update properly?
              if !node.valid? || !node.save!
                # Something we generated was not valid. Set the status code to 2
                @result['result']['status_code'] = 2
              else
                @result['result']['one_time_key'] = node.one_time_key
              end
            end
          else
            # Everything is not okay; status code > 0
            @result['result']['status_code'] = 1
          end
        end # Node.transaction

        respond_to do |format|
          if node == nil || @result['result']['status_code'] != 0
            format.json { render json: @result, status: :forbidden }
            format.txt { render :status => :forbidden, :content_type => Mime::TEXT }
          else
            format.json { render json: @result }
            format.txt { render :content_type => Mime::TEXT }
          end
        end
      end
    end
  end

  def authorize
    # Grab params
    mac = params[:mac_address]
    key = params[:one_time_key]
    auth_type = params[:auth_type]
    auth_key = params[:auth_key]

    # Fetch the node if it exists
    node = Node.find_by_mac_address(mac)
    node_nil = node == nil
    key_valid = !node_nil && one_time_key == node.one_time_key

    # Build the result hash to display
    @result = Hash.new
    @result['result'] = Hash.new

    if key_valid
      # Everything looks good
      node.update_one_time_key
      
      # Auth a user (hopefully)
      
      access_right = AccessControl.where(:access_control_type_id => auth_type, :value => auth_key, :enabled => true)

      if access_right != nil
        @result['result']['status_code'] = 0
        # TODO: Send command to calling object? How do we control the door remotely? Maybe we need a server running too?
      else
        # Could not auth the user. Set status code to 2
        @result['result']['status_code'] = 2
      end
    else
      # Everything is not okay; status code > 0
      @result['result']['status_code'] = 1
    end

    respond_to do |format|
      if node == nil
        format.json { render json: @result, status: :forbidden }
      else
        format.json { render json: @result }
      end
    end
  end
end
