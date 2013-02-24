require 'spec_helper'

describe "data_types/edit" do
  before(:each) do
    @data_type = assign(:data_type, stub_model(DataType,
      :name => "MyString",
      :unit => "MyString"
    ))
  end

  it "renders the edit data_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => data_types_path(@data_type), :method => "post" do
      assert_select "input#data_type_name", :name => "data_type[name]"
      assert_select "input#data_type_unit", :name => "data_type[unit]"
    end
  end
end
