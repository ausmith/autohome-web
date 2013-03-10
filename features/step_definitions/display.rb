Then /^I should see "(.*?)"$/ do |message|
  page.should have_content(message)
end

Then /^I should not see "(.*?)"$/ do |message|
  page.should_not have_content(message)
end
