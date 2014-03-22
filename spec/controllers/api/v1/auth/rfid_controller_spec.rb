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

require 'spec_helper'

describe Api::V1::Auth::RfidController do
  let(:valid_attributes) {
    {
      
    }
  }

  node = nil
  token = nil

  before(:each) do
    # Make sure node and RFID key exist
    node = FactoryGirl.create(:node)
    token = FactoryGirl.create(:rfid_access_control)
  end


  describe "POST auth" do
    # Assuming auth is already done
    it "has full-hand notation" do
      expect {
        post :auth, {
          :mac_address => node.mac_address,
          :rfid_id => token.value,
          :one_time_key => node.one_time_key
        }
      }.to change(SecEvent, :count).by(1)

      result = assigns(:result)

      result.should_not be_nil
      result['result'].should_not be_nil
      result['result']['status_code'].should == 0
      result['result']['new_one_time_key'].should_not be_nil
      
      node.one_time_key = result['result']['new_one_time_key']

      event = SecEvent.last

      event.should_not be_nil
      event.sec_event_type_cd.should eq('RFIDSUCCES')
    end

    it "has short-hand notation" do
      expect {
        post :auth, {
          :M => node.mac_address,
          :R => token.value,
          :O => node.one_time_key
        }
      }.to change(SecEvent, :count).by(1)
      result = assigns(:result)

      result.should_not be_nil
      result['result'].should_not be_nil
      result['result']['status_code'].should == 0
      result['result']['new_one_time_key'].should_not be_nil
      
      node.one_time_key = result['result']['new_one_time_key']

      event = SecEvent.last

      event.should_not be_nil
      event.sec_event_type_cd.should eq('RFIDSUCCES')
    end

    it "rejects RFID access tokens that do not exist" do
      expect {
        post :auth, {
          :M => node.mac_address,
          :R => token.value + "a",
          :O => node.one_time_key
        }
      }.to change(SecEvent, :count).by(1)
      result = assigns(:result)

      result.should_not be_nil
      result['result'].should_not be_nil
      result['result']['status_code'].should == 3
      result['result']['new_one_time_key'].should_not be_nil
      
      node.one_time_key = result['result']['new_one_time_key']

      event = SecEvent.last

      event.should_not be_nil
      event.sec_event_type_cd.should eq('RFIDDNE')
    end

    it "rejects RFID access tokens that are not enabled" do
      # Change the token so that it is disabled.
      token.enabled = false
      token.save

      expect {
        post :auth, {
          :M => node.mac_address,
          :R => token.value,
          :O => node.one_time_key
        }
      }.to change(SecEvent, :count).by(1)
      result = assigns(:result)

      result.should_not be_nil
      result['result'].should_not be_nil
      result['result']['status_code'].should == 3
      result['result']['new_one_time_key'].should_not be_nil
      
      node.one_time_key = result['result']['new_one_time_key']

      event = SecEvent.last

      event.should_not be_nil
      event.sec_event_type_cd.should eq('RFIDDISABL')
    end

    it "rejects requests that provide an invalid one-time-key" do
      # Change the token so that it is disabled.
      token.enabled = false
      token.save

      expect {
        post :auth, {
          :M => node.mac_address,
          :R => token.value,
          :O => node.one_time_key + "a"
        }
      }.to change(SecEvent, :count).by(1)
      result = assigns(:result)

      result.should_not be_nil
      result['result'].should_not be_nil
      result['result']['status_code'].should == 1
      result['result']['new_one_time_key'].should be_nil
      
      node.one_time_key = result['result']['new_one_time_key']

      event = SecEvent.last

      event.should_not be_nil
      event.sec_event_type_cd.should eq('NODEFAIL')
    end
  end
end
