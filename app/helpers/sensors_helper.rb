module SensorsHelper
  def get_sensor_link(sensor)
    sensor ? link_to(sensor.name, sensor) : '-'
  end
end
