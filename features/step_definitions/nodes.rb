Given /^I have rooms entitled "(.*?)"$/ do |rooms|
  room_list = rooms.split(/, ?/)

  room_list.each do |room|
    create(:room, name: room)
  end
end

Given /^I have nodes with MAC addresses "(.*?)"$/ do |nodes|
  node_list = nodes.split(/, ?/)

  node_list.each do |node|
    create(:node, mac_address: node)
  end
end

Given /^I am on the node edit page for "(.*?)"$/ do |mac_address|
  node = Node.find_by_mac_address(mac_address)

  visit "/nodes/#{node.id}/edit"
end

Given /^I am on the node page for "(.*?)"$/ do |mac_address|
  node = Node.find_by_mac_address(mac_address)

  visit "/nodes/#{node.id}"
end

Given /^I have node "(.*?)" attached to rooms "(.*?)"$/ do |node, rooms|
  n = Node.find_by_mac_address(node)
  room_list = rooms.split(/, ?/)

  room_list.each do |room|
    n.rooms << Room.find_by_name(room)
  end
end
