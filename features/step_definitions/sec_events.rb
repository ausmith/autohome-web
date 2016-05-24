Then /a "(.*?)" security event should have been logged with description "(.*?)"$/ \
  do |event_type, description|
  last_event = SecEvent.last

  # Ensure everything exists
  last_event.should_not be_nil

  last_event.description.should == description
  last_event.sec_event_type_cd.should == event_type
end

Then /a "(.*?)" security event should have been logged for "(.*?)"$/ do |event_type, email|
  user = User.where(email: email).first
  last_event = SecEvent.last

  # Ensure everything exists
  user.should_not be_nil
  last_event.should_not be_nil

  last_event.user_id.should == user.id
  last_event.sec_event_type_cd.should == event_type
end
