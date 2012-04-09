class Sensor
  @@type_id = 1
  @id = nil
  @value = nil
  
  def initialize ( id )
    @id = id
  end
  
  def type
    "Generic"
  end
  
  def type_id
    @type_id
  end
  
  def id
    @id
  end
  
  def value
    @value
  end
end