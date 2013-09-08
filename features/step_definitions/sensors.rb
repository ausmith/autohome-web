Then(/^I should get the following sensor name validation results$/) do |table|
  for row in table do
    fill_in 'sensor_name', :with => row[ 0 ]
  end
end

When(/^I fill the sensor form with valid data$/) do
  fill_in 'sensor_name', :with => '12345'
  fill_in 'sensor_node', :with => Node.last.mac_address
  fill_in 'sensor_sensor_type', :with => SensorType.last.name
  fill_in 'sensor_starting_pin', :with => 1
  fill_in 'sensor_pin_type', :with => 'Digital'
end
