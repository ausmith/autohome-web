Given /^I am registered as "(.*?)" with password "(.*?)"$/ do |username, password|
  if( User.find_by_email(username) == nil )    
    u = User.new
    u.email = username
    u.password = password
    
    if( u.valid? )
      u.save
      u.confirm!
    end
    
  end
  
end

Given /^I am registered as admin user "(.*?)" with password "(.*?)"$/ do |username, password|
  u = User.find_by_email(username)
  
  if( u == nil )    
    u = User.new
    u.email = username
    u.password = password
    u.admin = true
    
    if( u.valid? )
      u.save
      u.confirm!
    end
  else
    u.admin = true
    
    if( u.valid? )
      u.save
      u.confirm!
    end
  end
  
end

Given /^I am registered as non-admin user "(.*?)" with password "(.*?)"$/ do |username, password|
  u = User.find_by_email(username)
  
  if( u == nil )    
    u = User.new
    u.email = username
    u.password = password
    u.admin = false
    
    if( u.valid? )
      u.save
      u.confirm!
    end
  else
    u.admin = false
    
    if( u.valid? )
      u.save
      u.confirm!
    end
  end
  
end

When /^I set "(.*?)"s first name to "(.*?)"$/ do |email, name|
  u = User.find_by_email( email )
  u.should_not be_nil
  u.first_name = name
  u.should be_valid
  u.save
end

When /^I set "(.*?)"s last name to "(.*?)"$/ do |email, name|
  u = User.find_by_email( email )
  u.should_not be_nil
  u.last_name = name
  u.should be_valid
  u.save
end

When /^I logon as "(.*?)" with password "(.*?)"$/ do |username, password|
  visit '/users/sign_in'  
  
  within("#new_user") do
    fill_in 'Email', :with => username
    fill_in 'Password', :with => password
  end
  
  click_button 'Sign in'

end