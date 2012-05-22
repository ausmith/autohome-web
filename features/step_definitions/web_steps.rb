require 'clearance/testing'

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I am not logged in$/ do
  page.should have_content("Sign in")
end

Given /^I am logged in$/ do
  page.should have_content("Sign out")
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |key, value|
  fill_in(key, :with => value)
end

When /^I press the "([^"]*)" button$/ do |element|
  click_button(element)
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

# "Then" statements

Then /^I should not be redirected$/ do
  page.driver.status_code.should == 200
end

Then /^the page should not exist$/ do
  page.driver.status_code.should == 404
end

Then /^I should be redirected to (.+)$/ do |page|
  current_path.should == page
end


Then /^I should see "([^"]*)"$/ do |search|
  page.should have_content( search.gsub( /<.+?>/, '') )
end

Then /^I should not see "([^"]*)"$/ do |search|
  page.should_not have_content( search.gsub( /<.+?>/, '') )
end

Then /^I should be on (.+)$/ do |page|
  current_path.should == path_to(page)
end

Then /^show me the page$/ do
  save_and_open_page
end
