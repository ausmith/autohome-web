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
            @result['result']['one_time_key'] = node.one_time_key
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

      def report
        mac = params[:mac_address]
        key = params[:one_time_key]

        # Fetch the node if it exists
        node = Node.find_by_mac_address(mac)
        node_nil = node == nil
        key_valid = !node_nil && key == node.one_time_key

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
          begin
            current_pin_number = params["pin_#{current_pin_number}_location"]
            current_pin_value  = params["pin_#{current_pin_number}_value"]

            if current_pin_number != nil && current_pin_value != nil
              # Build the data point to put into the database.
              # For now, just PUTS them to stdout
              puts current_pin_number
              puts current_pin_value
            else
              have_pin = false
            end
          end while have_pin

          if !node.valid? || !node.save!
            # Something we generated was not valid. Set the status code to 2
            @result['result']['status_code'] = 2
          else
            @result['result']['one_time_key'] = node.one_time_key
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
  end
end
