When /^I ask to delete the super admin account$/ do
  if( (u = User.find_by_id(1)) != nil )
    User.destroy(1)
  else
    puts "Error: No users existed."
  end
  
end

Then /^the super admin account should still exist$/ do
  User.find_by_id(1).should_not be_nil
end
