class SecEventType < ActiveRecord::Base
  self.primary_key = 'type_cd'
  attr_accessible :description, :type_cd
  
  has_many :sec_events, :foreign_key => 'sec_event_type_cd'
end
