require 'spec_helper'

describe "nodes/show" do
  before(:each) do
    @node = assign(:node, stub_model(Node,
      :mac_address => "Mac Address",
      :status => 1,
      :take_offline => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mac Address/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
