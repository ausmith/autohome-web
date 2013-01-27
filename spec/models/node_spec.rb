require 'spec_helper'

describe Node do
  it "has a valid Factory" do
    FactoryGirl.create(:node).should be_valid
  end

  it "has a valid MAC address"

  it "has a valid status"
  it "is attached to a room"
end
