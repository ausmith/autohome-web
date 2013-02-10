Given /^I am registered as "(.*?)" with password "(.*?)"$/ do |username, password|
  visit '/users/sign_up'
  
  if( User.find_by_email(username) == nil )    
    u = User.new
    u.email = username
    u.password = password
    
    if( u.valid? )
      u.save
    end
    
  end
  
end

When /^I logon as "(.*?)" with password "(.*?)"$/ do |username, password|
  visit '/users/sign_in'  
  
  within("#new_user") do
    fill_in 'Email', :with => username
    fill_in 'Password', :with => password
  end
  
  click_button 'Sign in'

end

Then /^I should be on the dashboard$/ do
  #save_and_open_page
  
  [dashboard_path, root_path].should include current_path
end

Then /^I should see "(.*?)"$/ do |message| 
  page.should have_content(message)
end