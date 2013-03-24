require 'spec_helper'

describe "sensors/new" do
  before(:each) do
    assign(:sensor, stub_model(Sensor,
      :name => "MyString",
      :node_id => 1,
      :sensor_type_id => 1,
      :starting_pin => 1
    ).as_new_record)
  end

  it "renders new sensor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sensors_path, "post" do
      assert_select "input#sensor_name[name=?]", "sensor[name]"
      assert_select "select#sensor_node_id[name=?]", "sensor[node_id]"
      assert_select "select#sensor_sensor_type_id[name=?]", "sensor[sensor_type_id]"
      assert_select "input#sensor_starting_pin[name=?]", "sensor[starting_pin]"
      assert_select "select#sensor_pin_type[name=?]", "sensor[pin_type]"
    end
  end
end
