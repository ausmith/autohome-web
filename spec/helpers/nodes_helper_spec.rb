require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the NodesHelper. For example:
#
# describe NodesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe NodesHelper do
  it "outputs \"-\" when the node is empty" do
    get_node_link(nil).should == '-'
  end

  it "outputs a link to a node when the node is not empty" do
    node = stub_model(Node, mac_address: '00:11:22:33:44:56', id: 321)

    get_node_link(node).should == link_to(node.mac_address, node)
  end
end
