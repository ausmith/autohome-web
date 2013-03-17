require 'spec_helper'

describe "data_types/index" do
  before(:each) do
    assign(:data_types, [
      stub_model(DataType,
        :longhand_unit => "Celsius",
        :shorthand_unit => "C"
      ),
      stub_model(DataType,
        :longhand_unit => "Farenheit",
        :shorthand_unit => "F"
      )
    ])
  end

  it "renders a list of data_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Celsius".to_s, :count => 1
    assert_select "tr>td", :text => "Farenheit".to_s, :count => 1
    assert_select "tr>td", :text => "C".to_s, :count => 1
    assert_select "tr>td", :text => "F".to_s, :count => 1
  end
end
