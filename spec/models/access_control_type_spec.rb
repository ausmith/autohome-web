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

describe AccessControlType do
  it "has a valid factory" do
    FactoryGirl.build(:access_control_type).should be_valid
  end

  it "has a valid name" do
    # Syntactically valid name
    FactoryGirl.build(:access_control_type).should be_valid

    # Blank name
    FactoryGirl.build(:access_control_type, :name => '').should_not be_valid

    # Too short
    FactoryGirl.build(:access_control_type, :name => 'a').should_not be_valid

    # Too long
    FactoryGirl.build(:access_control_type, :name => '12345678901234567890123456789012345678901234567890123456789012345').should_not be_valid
  end
end
