When /^I enter "(.*?)" in "(.*?)"$/ do |value, key|
  fill_in key, :with => value
end

When /^I click the button "(.*?)"$/ do |key|
  click_button key
end

When /^I click the link "(.*?)"$/ do |key|
  click_link key
end
