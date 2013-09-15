class SecEventType < ActiveRecord::Base
  attr_accessible :description
  
  has_many :sec_events
end
