require 'spec_helper'

describe "data_types/index" do
  before(:each) do
    assign(:data_types, [
      stub_model(DataType,
        :name => "Name",
        :unit => "Unit"
      ),
      stub_model(DataType,
        :name => "Name",
        :unit => "Unit"
      )
    ])
  end

  it "renders a list of data_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
  end
end
