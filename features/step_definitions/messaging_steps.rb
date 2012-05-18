Then /^I should see the error message for (.+)$/ do |message_type|
  page.should have_content( message_name( message_type ) )
end
