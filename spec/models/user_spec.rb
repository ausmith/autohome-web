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

describe User do
  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end

  it "cannot be deleted if root" do
    u = User.find_by_id( 1 )
    u.should_not be_nil

    u.destroy
    User.find_by_id( 1 ).should_not be_nil 
  end

  it "can be soft deleted" do
    user = FactoryGirl.create(:user)

    user.should be_valid

    user.soft_delete

    user.should be_valid
    user.deleted_at.should_not be_nil
  end

  it "has a display_name helper method" do
    user = FactoryGirl.build(:user)
    user.should be_valid
    user.display_name.should eq(user.first_name)

    user = FactoryGirl.build(:user, :first_name => nil)
    user.should_not be_valid
    user.display_name.should eq(user.email)
  end

  it "has a display_full_name helper method" do
    user = FactoryGirl.build(:user)
    user.should be_valid
    user.display_full_name.should eq(user.first_name + " " + user.last_name)

    user = FactoryGirl.build(:user, :first_name => nil)
    user.should_not be_valid
    user.display_full_name.should eq(user.email)

    user = FactoryGirl.build(:user, :last_name => nil)
    user.should_not be_valid
    user.display_full_name.should eq(user.email)

    user = FactoryGirl.build(:user, :first_name => nil, :last_name => nil)
    user.should_not be_valid
    user.display_full_name.should eq(user.email)

    # Blanks, not nils
    user = FactoryGirl.build(:user, :first_name => "")
    user.should_not be_valid
    user.display_full_name.should eq(user.email)

    user = FactoryGirl.build(:user, :last_name => "")
    user.should_not be_valid
    user.display_full_name.should eq(user.email)

    user = FactoryGirl.build(:user, :first_name => "", :last_name => "")
    user.should_not be_valid
    user.display_full_name.should eq(user.email)
  end
end
