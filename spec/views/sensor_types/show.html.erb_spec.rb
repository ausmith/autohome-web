require 'spec_helper'

describe "sensor_types/show" do
  before(:each) do
    @sensor_type = assign(:sensor_type, stub_model(SensorType,
      :name => "Name",
      :description => "MyText",
      :data_type_id => 1,
      :pins_used => 2,
      :library_file => "Library File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Library File/)
  end
end
