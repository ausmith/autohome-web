require 'spec_helper'

describe "sensors/edit" do
  before(:each) do
    @sensor = assign(:sensor, stub_model(Sensor,
      :name => "MyString",
      :node_id => 1,
      :sensor_type_id => 1,
      :starting_pin => 1
    ))
  end

  it "renders the edit sensor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sensor_path(@sensor), "post" do
      assert_select "input#sensor_name[name=?]", "sensor[name]"
      assert_select "input#sensor_node_id[name=?]", "sensor[node_id]"
      assert_select "input#sensor_sensor_type_id[name=?]", "sensor[sensor_type_id]"
      assert_select "input#sensor_starting_pin[name=?]", "sensor[starting_pin]"
    end
  end
end
