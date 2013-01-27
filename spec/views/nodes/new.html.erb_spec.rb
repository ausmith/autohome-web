require 'spec_helper'

describe "nodes/new" do
  before(:each) do
    assign(:node, stub_model(Node,
      :mac_address => "MyString",
      :status => 1,
      :take_offline => false
    ).as_new_record)
  end

  it "renders new node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path, :method => "post" do
      assert_select "input#node_mac_address", :name => "node[mac_address]"
      assert_select "input#node_status", :name => "node[status]"
      assert_select "input#node_take_offline", :name => "node[take_offline]"
    end
  end
end
