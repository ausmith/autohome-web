require 'spec_helper'

describe "dashboard/index.html.erb" do
  it "says hello" do
    render

    assert_select "p", :text => "Welcome to your dashboard.".to_s, :count => 1
  end
end
