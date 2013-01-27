require 'spec_helper'

describe "nodes/index" do
  before(:each) do
    assign(:nodes, [
      stub_model(Node,
        :mac_address => "Mac Address",
        :ip_address => "Ip Address",
        :status => 1,
        :take_offline => false,
        :room_id => 2
      ),
      stub_model(Node,
        :mac_address => "Mac Address",
        :ip_address => "Ip Address",
        :status => 1,
        :take_offline => false,
        :room_id => 2
      )
    ])
  end

  it "renders a list of nodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mac Address".to_s, :count => 2
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
