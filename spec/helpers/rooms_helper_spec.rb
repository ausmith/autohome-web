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
describe RoomsHelper do
  it "outputs \"-\" when the room is empty" do
    get_room_link(nil).should == '-'
  end

  it "outputs a link to a room when the room is not empty" do
    room = stub_model(Room, name: "RSpec Room", id: 321)

    get_room_link(room).should == link_to(room.name, room)
  end
end
