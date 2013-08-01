require 'spec_helper'

describe "access_controls/index" do
  before(:each) do
    assign(:access_controls, [
      stub_model(AccessControl,
        :access_control_type_id => 1,
        :value => "Value",
        :description => "Description",
        :enabled => false,
        :user_id => User.first.to_param
      ),
      stub_model(AccessControl,
        :access_control_type_id => 1,
        :value => "Value",
        :description => "Description",
        :enabled => false,
        :user_id => User.first.to_param
      )
    ])

    assign(:user,
      stub_model(User,
        :id => 1,
        :email => "root@example.com"
      )
    )
  end

  it "renders a list of access_controls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
