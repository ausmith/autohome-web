class AddSecEventTypes < ActiveRecord::Migration
  def up
    SecEventType.create :type_cd => 'RFIDDNE', :description => 'sec_event_types.auth.rfid.carddne'
    SecEventType.create :type_cd => 'RFIDDISABL', :description => 'sec_event_types.auth.rfid.carddisabled'
    SecEventType.create :type_cd => 'RFIDSUCCES', :description => 'sec_event_types.auth.rfid.accesssuccess'
    SecEventType.create :type_cd => 'LOGINPASS', :description => 'sec_event_types.auth.web.loginsuccess'
    SecEventType.create :type_cd => 'LOGINFAIL', :description => 'sec_event_types.auth.web.loginpwfail'
    SecEventType.create :type_cd => 'LOGINDNE', :description => 'sec_event_types.auth.web.loginuserdne'
    SecEventType.create :type_cd => 'PASSRESET', :description => 'sec_event_types.auth.web.loginpwreset'
  end

  def down
    SecEventType.where(:description => 'sec_event_types.auth.rfid.carddne').destroy_all
    SecEventType.where(:description => 'sec_event_types.auth.rfid.carddisabled').destroy_all
    SecEventType.where(:description => 'sec_event_types.auth.rfid.accesssuccess').destroy_all
    SecEventType.where(:description => 'sec_event_types.auth.web.loginsuccess').destroy_all
    SecEventType.where(:description => 'sec_event_types.auth.web.loginpwfail').destroy_all
    SecEventType.where(:description => 'sec_event_types.auth.web.loginuserdne').destroy_all
    SecEventType.where(:description => 'sec_event_types.auth.web.loginpwreset').destroy_all
  end
end