# This file contains every step definition that involves confirming that we are
# on page 'X'


# Confirms that we are on the dashboard.
Then /^I should be on the dashboard$/ do
  [dashboard_path, root_path].should include current_path
end

Then /^I should be on the logon page$/ do  
  new_user_session_path.should include current_path
end

Then /^I should be on the users page$/ do  
  users_path.should include current_path
end

Then /^I should be on the profile edit page of "([^\"]*?)"$/ do |email|
  u = User.find_by_email( email )
  edit_user_path(u).should include current_path
end

Then /^I should be on the create_sensor page$/ do  
  new_sensor_path.should include current_path
end

Then /^I should be on the most recent show_sensor page$/ do  
  sensor_path(Sensor.last.id).should include current_path
end
