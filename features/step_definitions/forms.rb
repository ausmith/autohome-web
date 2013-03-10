When /^I enter "(.*?)" in "(.*?)"$/ do |value, key|
  fill_in key, :with => value
end

When /^I click the button "(.*?)"$/ do |key|
  click_button key
end

When /^I click the link "(.*?)"$/ do |key|
  click_link key
end

When /^I uncheck the checkboxes "(.*?)"$/ do |checkboxes|
  checkboxes_list = checkboxes.split(/, ?/)

  checkboxes_list.each do |checkbox|
    uncheck(checkbox)
  end
end

When /^I check the checkboxes "(.*?)"$/ do |checkboxes|
  checkboxes_list = checkboxes.split(/, ?/)

  checkboxes_list.each do |checkbox|
    check(checkbox)
  end
end
