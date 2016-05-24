require 'spec_helper'

describe "nodes/index" do
  before(:each) do
    rooms = [stub_model(Room,
                        id: 2,
                        name: "Room A")
    ]
    assign(:rooms, rooms)

    assign(:nodes, [
      stub_model(Node,
        :mac_address => "Mac Address",
        :ip_address => "Ip Address",
        :status => 1,
        :take_offline => false
      ),
      stub_model(Node,
        :mac_address => "Mac Address",
        :ip_address => "Ip Address",
        :status => 1,
        :take_offline => false
      )
    ])
    Node.any_instance.stub(:rooms).and_return(rooms)
  end

  it "renders a list of nodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mac Address".to_s, :count => 2
    assert_select "tr>td", :text => "Ip Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Room A".to_s, :count => 2
  end
end
