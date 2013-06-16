require 'spec_helper'

describe "access_controls/edit" do
  before(:each) do
    @user = User.first
    @access_control = assign(:access_control, stub_model(AccessControl,
      :access_control_type_id => 1,
      :value => "MyString",
      :description => "MyString",
      :enabled => false,
      :user_id => User.first.to_param
    ))
  end

  it "renders the edit user_access_control form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => "/users/#{User.first.to_param}/access_controls/#{@access_control.id}", :method => "post" do
      assert_select "select#access_control_access_control_type_id[name=?]", "access_control[access_control_type_id]"
      assert_select "input#access_control_value[name=?]", "access_control[value]"
      assert_select "input#access_control_description[name=?]", "access_control[description]"
      assert_select "input#access_control_enabled[name=?]", "access_control[enabled]"
    end
  end
end
