module NodesHelper
  def get_node_link(node)
    node ? link_to(node.mac_address, node) : '-'
  end
end
