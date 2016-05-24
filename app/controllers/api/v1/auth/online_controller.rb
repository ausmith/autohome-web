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

#require 'secure_random'
module Api
  module V1
    module Auth
      class OnlineController < ApplicationController
        include SecEventsHelper

        skip_before_filter :authenticate_user!
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
          mac = params[:mac_address] || params[:M]
          initialization_key = params[:initialization_key] || params[:I]

          # Fetch the node if it exists
          node = Node.available.find_by_mac_address(mac)
          node_nil = node == nil
          key_valid = !node_nil && initialization_key == node.initialization_key

          # Build the result hash to display
          @result = Hash.new
          @result['result'] = Hash.new

          if key_valid
            # Everything looks good; create a new initialization key and one-time key.
            @result['result']['status_code'] = 0

            if !node.valid? || !node.save!
              # Something we generated was not valid. Set the status code to 2
              @result['result']['status_code'] = 2
              create_audit(:NODEONLINEFAIL, node_id: node.id)
            else
              @result['result']['new_initialization_key'] = node.initialization_key
              @result['result']['new_one_time_key'] = node.one_time_key
              node.update_initialization_key
              node.update_one_time_key
              create_audit(:NODEONLINESUCCESS, node_id: node.id)
            end
          else
            # Everything is not okay; status code > 0
            @result['result']['status_code'] = 1
            create_audit(:NODEONLINEKEYFAIL, node_id: node.id)
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

      end
    end
  end
end
