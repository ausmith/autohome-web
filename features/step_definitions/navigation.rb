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

When /^I navigate to the new_user page$/ do
  visit '/users/sign_up'
end

Given /^I am on the create_room page$/ do
  visit '/admin/rooms/new'
end

When /^I go to my profile edit page$/ do
  click_link "Account"
  click_link "Edit Profile"
end

When /^I go to the profile of "(.*?)"$/ do |email|
  u = User.find_by_email(email)
  visit "/users/#{u.id}"
end

When /^I go to the profile edit page of "(.*?)"$/ do |email|
  u = User.find_by_email(email)
  visit "/users/#{u.id}/edit"
end

Given /^I am on the create_data_type page$/ do
  visit '/admin/data_types/new'
end

Given /^I am on the update_data_type page for "(.*?)"$/ do |name|
  d = DataType.find_by_longhand_unit(name)
  visit "/admin/data_types/#{d.id}/edit"
end

When /^I logout$/ do
  click_link "Log Out"
end

When /^I am on the create_sensor page$/ do
  visit '/admin/sensors/new'
end

# Used to test that a 403 error is thrown when using a particular step
# @author Brian Turchyn
# @since 1.0.0
Then(/^when (.+?) I should get a 403 error\.$/) do |action|
  lambda { step action }.should \
    raise_error(ApplicationController::ForbiddenException)
end

Then(/^I should get an HTTP (\d+) error$/) do |error_code|
  page.status_code.should == error_code.to_i
end
