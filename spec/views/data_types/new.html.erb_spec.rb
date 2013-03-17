require 'spec_helper'

describe "data_types/new" do
  before(:each) do
    assign(:data_type, stub_model(DataType,
      :longhand_unit => "Celsius",
      :shorthand_unit => "C"
    ).as_new_record)
  end

  it "renders new data_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => data_types_path, :method => "post" do
      assert_select "input#data_type_longhand_unit", :name => "data_type[longhand_unit]"
      assert_select "input#data_type_shorthand_unit", :name => "data_type[shorthand_unit]"
    end
  end
end
