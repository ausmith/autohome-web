class SecEvent < ActiveRecord::Base
  attr_accessible :description, :ip, :node_id, :room_id, :sensor_id, :sec_event_type_cd, :user_id
  
  belongs_to :user, :inverse_of => :sec_events
  belongs_to :room, :inverse_of => :sec_events
  belongs_to :node, :inverse_of => :sec_events
  belongs_to :sensor, :inverse_of => :sec_events
  belongs_to :sec_event_type, :primary_key => 'type_cd',
    :foreign_key => 'sec_event_type_cd', :inverse_of => :sec_events

  validates :sec_event_type, presence: true

  scope :available, include: [:user, :room, :node, :sensor, :sec_event_type]
  scope :recent, order: 'created_at DESC'
end
