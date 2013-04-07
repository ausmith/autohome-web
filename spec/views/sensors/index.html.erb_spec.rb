require 'spec_helper'

describe "sensors/index" do
  before(:each) do
    assign(:sensors, [
      stub_model(Sensor,
        :name => "Name",
        :node_id => 1,
        :sensor_type_id => 2,
        :starting_pin => 3
      ),
      stub_model(Sensor,
        :name => "Name",
        :node_id => 1,
        :sensor_type_id => 2,
        :starting_pin => 3
      )
    ])
  end

  it "renders a list of sensors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
