Given /^I am not registered as "(.*?)"$/ do |username|
  u = User.find_by_email(username)

  if( u != nil )    
    u.destroy   
  end
  
end

When /^I sign up with name "(.*?)" "(.*?)", email "(.*?)", and password "(.*?)"$/ do |first_name, last_name, username, password|
  visit '/users/sign_up'
  
  within("#new_user") do
    fill_in ' First name', :with => first_name
    fill_in ' Last name', :with => last_name
    fill_in ' Email', :with => username
    fill_in ' Password', :with => password
    fill_in ' Password confirmation', :with => password
  end
  
  click_button 'Sign up'
  
end

Then /^I should be registered as "(.*?)" and not confirmed$/ do |username|
  u = User.find_by_email(username)
  
  u.should_not == nil
  u.confirmation_token.should_not == nil
end

Then /^I should be registered as "(.*?)" with password "(.*?)"$/ do |username, password|
  u = User.find_by_email(username)
  u.should_not == nil
  u.password.should == password
end