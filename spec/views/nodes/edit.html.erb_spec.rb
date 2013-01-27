require 'spec_helper'

describe "nodes/edit" do
  before(:each) do
    @node = assign(:node, stub_model(Node,
      :mac_address => "AA:BB:CC:DD:EE:FF",
      :take_offline => false,
      :status => 1
    ))
  end

  it "renders the edit node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path(@node), :method => "post" do
      assert_select "input#node_mac_address", :name => "node[mac_address]"
      assert_select "input#node_take_offline", :name => "node[take_offline]"
      assert_select "input#node_status", :name => "node[status]"
    end
  end
end
