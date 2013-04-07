class Sensor < ActiveRecord::Base
  attr_accessible :name, :node_id, :sensor_type_id, :starting_pin, :pin_type

  enum_attr :pin_type, %w(Analog Digital)

  belongs_to :node
  belongs_to :sensor_type

  validates :name, :presence => true, :length => { :minimum => 2, :maximum => 64 }
  validates :node, :presence => true
  validates :sensor_type, :presence => true
  validates :starting_pin, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :pin_type, :inclusion => { :in => [:Analog, :Digital] }
end
