require 'spec_helper'

describe "admin/index.html.erb" do
  it "shows links to important sections" do
    render

    assert_select "li", :text => "Data Types".to_s, :count => 1
    assert_select "li", :text => "Nodes".to_s, :count => 1
    assert_select "li", :text => "Rooms".to_s, :count => 1
    assert_select "li", :text => "Sensor Types".to_s, :count => 1
    assert_select "li", :text => "Sensors".to_s, :count => 1
  end
end
