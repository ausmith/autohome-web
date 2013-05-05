class DataPoint < ActiveRecord::Base
  belongs_to :node
  belongs_to :sensor
  attr_accessible :node_id, :sensor_id, :value
end
