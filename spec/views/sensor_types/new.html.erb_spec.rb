require 'spec_helper'

describe "sensor_types/new" do
  before(:each) do
    assign(:sensor_type, stub_model(SensorType,
      :name => "MyString",
      :description => "MyText",
      :data_type_id => 1,
      :pins_used => 1,
      :library_file => "MyString"
    ).as_new_record)
  end

  it "renders new sensor_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sensor_types_path, "post" do
      assert_select "input#sensor_type_name[name=?]", "sensor_type[name]"
      assert_select "textarea#sensor_type_description[name=?]", "sensor_type[description]"
      assert_select "input#sensor_type_data_type_id[name=?]", "sensor_type[data_type_id]"
      assert_select "input#sensor_type_pins_used[name=?]", "sensor_type[pins_used]"
      assert_select "input#sensor_type_library_file[name=?]", "sensor_type[library_file]"
    end
  end
end
