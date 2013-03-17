Given /^I am on the create_room page$/ do
  visit '/admin/rooms/new'
end

When /^I go to my profile edit page$/ do
  click_link "Account"
  click_link "Edit Profile"
end
