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

describe Api::V1::DataCollectionController do
  let(:valid_attributes) {
    {
    }
  }

  node = nil
  token = nil

  before(:each) do
    node = FactoryGirl.create(:node)
    token = FactoryGirl.create(:rfid_access_control)
  end

  describe "POST online" do
    it "has full-hand notation" do
      post :online, {
        mac_address: node.mac_address,
        initialization_key: node.initialization_key
      }

      result = assigns(:result)

      result.should_not be_nil
    end

    it "has short-hand notation" do
      post :online, {
        M: node.mac_address,
        I: node.initialization_key
      }

      result = assigns(:result)

      result.should_not be_nil
    end

    it "provides a new one-time key"

    it "provides a new initialazation key"

    it "creates an NODEONLINESUCCESS audit entry on success"

    it "creates an NODEONLINEKEYFAIL audit entry when the initialization key is wrong"

    it "creates an NODEONLINEFAIL audit entry when there is an unknown issue"
  end

end

