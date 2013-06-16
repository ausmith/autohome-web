require 'spec_helper'

describe "access_controls/show" do
  before(:each) do
    @access_control = assign(:access_control, stub_model(AccessControl,
      :access_control_type_id => 1,
      :value => "Value",
      :description => "Description",
      :enabled => false
    ))

    assign(:user,
      stub_model(User,
        :user_id => 1
      )
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Value/)
    rendered.should match(/Description/)
    rendered.should match(/false/)
  end
end
