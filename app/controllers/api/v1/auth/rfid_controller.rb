###############################################################################
# This file is part of The Autohome Project.
#
# The Autohome Project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Autohome Project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with The Autohome Project.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

module Api
  module V1
    module Auth
      class RfidController < ApplicationController
        include SecEventsHelper

        skip_before_filter :authenticate_user!
        skip_before_filter :verify_authenticity_token
        respond_to :json
        respond_to :txt

        def auth
          # Grab parameters
          mac = params[:mac_address] || params[:M]
          key = params[:one_time_key] || params[:O]
          rfid_key = params[:rfid_id] || params[:R]

          # Fetch node if it exists
          node = Node.available.find_by_mac_address(mac)
          node_nil = node == nil
          key_valid = !node_nil && key == node.one_time_key

          # Build the result hash to display
          @result = Hash.new
          @result['result'] = Hash.new

          if key_valid
            node.update_one_time_key

            if !node.valid? || !node.save!
              @result['result']['status_code'] = 2
            else
              @result['result']['new_one_time_key'] = node.one_time_key
            end

            # Look for the RFID access control with this ID
            access_control = AccessControl.joins(
              :access_control_type
            ).where(
              access_control_types: {
                id: 1
              },
              value: rfid_key
            ).first

            if access_control != nil
              # We have an access control mechanism. Check if it is enabled
              if access_control.enabled == true
                # All good. Audit the entry, perform any post-authing tasks
                @result['result']['status_code'] = 0

                create_audit(:RFIDSUCCES,
                             user_id: access_control.user_id,
                             description: rfid_key)
              else
                # Fail -- user not permitted access.
                @result['result']['status_code'] = 3
                create_audit(:RFIDDISABL,
                             user_id: access_control.user_id,
                             description: rfid_key)
              end
            else
              @result['result']['status_code'] = 3
              create_audit(:RFIDDNE,
                            description: rfid_key)
            end

          else
            # Everything is not okay; status code > 0
            @result['result']['status_code'] = 1
            create_audit(:NODEFAIL,
                          description: rfid_key)
          end

          # All done; send off the response
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
      end
    end
  end
end
