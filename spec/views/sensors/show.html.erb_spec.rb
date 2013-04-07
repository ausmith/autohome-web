require 'spec_helper'

describe "sensors/show" do
  before(:each) do
    @sensor = assign(:sensor, stub_model(Sensor,
      :name => "Name",
      :node_id => 1,
      :sensor_type_id => 2,
      :starting_pin => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
