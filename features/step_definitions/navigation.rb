Given /^I am on the create_room page$/ do
  visit '/admin/rooms/new'
end

When /^I go to my profile edit page$/ do
  click_link "Account"
  click_link "Edit Profile"
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