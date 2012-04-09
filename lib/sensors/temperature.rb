class TemperatureSensor < Sensor
  @@type_id = 2
  
  def initialize ( id, value=nil )
    super ( id )
    @value = value
  end
end