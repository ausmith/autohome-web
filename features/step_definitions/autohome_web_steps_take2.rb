Given /^I am registered as "(.*?)" "(.*?)"$/ do |username, password|
  visit '/users/sign_up'
  
  within("#new_user") do
    fill_in 'Email', :with => username
    fill_in 'Password', :with => password
    fill_in 'Password confirmation', :with => password
  end
  
  click_button 'Sign up'
end

When /^I go to the logon page$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I enter "(.*?)" into "(.*?)" field$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When /^I click the "(.*?)" button$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should be on the dashboard$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should have a status code of (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end