require 'spec_helper'

describe Node do
  it "has a valid Factory" do
    FactoryGirl.build(:node).should be_valid
  end

  it "has a valid MAC address" do
    # Pass a syntactically-valid one
    FactoryGirl.build(:node, :mac_address => '01:23:45:67:89:AB').should be_valid
    FactoryGirl.build(:node, :mac_address => 'CD:EF:ab:cd:ef:01').should be_valid

    # One character out-of-scope
    FactoryGirl.build(:node, :mac_address => 'g1:23:45:67:89:AB').should_not be_valid
    FactoryGirl.build(:node, :mac_address => 'Z1:23:45:67:89:AB').should_not be_valid
    FactoryGirl.build(:node, :mac_address => '?1:23:45:67:89:AB').should_not be_valid

    # No Colons
    FactoryGirl.build(:node, :mac_address => '0123456789AB').should_not be_valid

    # Nil MAC address
    FactoryGirl.build(:node, :mac_address => nil).should_not be_valid

    # Blank MAC address
    FactoryGirl.build(:node, :mac_address => '').should_not be_valid
  end

  it "has a valid status" do
    FactoryGirl.build(:node, :status => Node.status()[:active]).should be_valid
    FactoryGirl.build(:node, :status => Node.status()[:taken_offline]).should be_valid
    FactoryGirl.build(:node, :status => Node.status()[:inactive]).should be_valid
    FactoryGirl.build(:node, :status => Node.status()[:error]).should be_valid 
  end

  it "is attached to a room"
end
