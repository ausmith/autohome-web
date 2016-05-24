require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the NodesHelper. For example:
#
# describe NodesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe SensorsHelper do
  it "outputs \"-\" when the sensor is empty" do
    get_sensor_link(nil).should == '-'
  end

  it "outputs a link to a sensor when the sensor is not empty" do
    sensor = stub_model(Sensor, name: "RSpec Sensor", id: 321)

    get_sensor_link(sensor).should == link_to(sensor.name, sensor)
  end
end
