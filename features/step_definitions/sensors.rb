When /^I fill the sensor form with "(.*?)"$/ do |name|
  fill_in 'sensor_name', :with => name
  select( Node.last.mac_address, :from => 'sensor_node_id')
  select( SensorType.last.name, :from => 'sensor_sensor_type_id')
  fill_in 'sensor_starting_pin', :with => 1
  select( 'Digital', :from => 'sensor_pin_type')
  click_button 'Create Sensor'
end

Given /^at least one sensor type exists$/ do
  t = SensorType.first;
  
  if( t == nil )
    t = SensorType.new
    t.id = 1
    t.name = "sampleSensor"
    t.description = "Temperature"
    t.pins_used = 1
    t.library_file = "anything.rb"
    
    d = DataType.first;
    if( d == nil )
        d = DataType.new
        d.longhand_unit = "Celsius"
        d.shorthand_unit = "C"
        d.save
    end
       
    t.data_type_id = d.id
    t.save    
  end
end