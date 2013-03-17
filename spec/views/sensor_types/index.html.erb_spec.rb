require 'spec_helper'

describe "sensor_types/index" do
  before(:each) do
    assign(:sensor_types, [
      stub_model(SensorType,
        :name => "Name",
        :description => "MyText",
        :data_type_id => 1,
        :pins_used => 2,
        :library_file => "Library File"
      ),
      stub_model(SensorType,
        :name => "Name",
        :description => "MyText",
        :data_type_id => 1,
        :pins_used => 2,
        :library_file => "Library File"
      )
    ])
  end

  it "renders a list of sensor_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Library File".to_s, :count => 2
  end
end
