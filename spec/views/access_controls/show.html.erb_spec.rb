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

describe "access_controls/show" do
  before(:each) do

    @access_control = assign(:access_control, stub_model(AccessControl,
      :access_control_type =>  stub_model(AccessControlType,
        :id => 1,
        :name => 'RFID Tag'
      ),
      :value => "Value",
      :description => "Description",
      :enabled => false
    ))

    assign(:user,
      stub_model(User,
        :user_id => 1
      )
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Value/)
    rendered.should match(/Description/)
    rendered.should match(/false/)
  end
end
