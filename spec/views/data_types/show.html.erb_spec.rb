require 'spec_helper'

describe "data_types/show" do
  before(:each) do
    @data_type = assign(:data_type, stub_model(DataType,
      :name => "Name",
      :unit => "Unit"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Unit/)
  end
end
