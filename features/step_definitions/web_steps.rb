require 'clearance/testing'

Given /^(?:|I )am on the (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am not logged in$/ do
  page.should have_content("Sign in")
end

Given /^I am logged in$/ do
  page.should have_content("Sign out")
end

# "Then" statements

Then /^I should not be redirected$/ do
  page.driver.status_code.should == 200
end

Then /^I should see "([^"]*)"$/ do |search|
  page.should have_content(search)
end
