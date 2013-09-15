class AddSecEventTypes < ActiveRecord::Migration
  def up
    SecEventType.create :description => 'sec_event_types.auth.rfid.carddne'
    
    SecEventType.create :description => 'sec_event_types.auth.rfid.carddisabled'
    
    SecEventType.create :description => 'sec_event_types.auth.rfid.accesssuccess'
     
    SecEventType.create :description => 'sec_event_types.auth.web.loginsuccess'
     
    SecEventType.create :description => 'sec_event_types.auth.web.loginpwfail'
     
    SecEventType.create :description => 'sec_event_types.auth.web.loginuserdne'
     
    SecEventType.create :description => 'sec_event_types.auth.web.loginpwreset'
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
