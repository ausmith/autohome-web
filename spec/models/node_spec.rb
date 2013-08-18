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
    # Supply all the valid ones
    FactoryGirl.build(:node, :status => Node.status()[:active]).should be_valid
    FactoryGirl.build(:node, :status => Node.status()[:taken_offline]).should be_valid
    FactoryGirl.build(:node, :status => Node.status()[:inactive]).should be_valid
    FactoryGirl.build(:node, :status => Node.status()[:error]).should be_valid

    # Chuck in some bad values for good measure
    FactoryGirl.build(:node, :status => nil).should_not be_valid
    FactoryGirl.build(:node, :status => 0).should_not be_valid
    FactoryGirl.build(:node, :status => -100).should_not be_valid
    FactoryGirl.build(:node, :status => "failbus").should_not be_valid
    FactoryGirl.build(:node, :status => "50").should_not be_valid
  end

  it "is attached to a room" do
    a = FactoryGirl.build(:node)
    a.should be_valid

    a.room_ids = nil
    a.should_not be_valid
  end

  it "updates the one time key when told to" do
    a = FactoryGirl.build(:node)
    old_one_time_key = a.one_time_key
    a.update_one_time_key
    a.one_time_key.should_not eq(old_one_time_key)

    # Check that the old one-time key was stored
    a.old_one_time_key.should eq(old_one_time_key)
  end

  it "updates the initialization key when told to" do
    a = FactoryGirl.build(:node)
    old_init_key = a.initialization_key
    a.update_initialization_key
    a.initialization_key.should_not eq(old_init_key)

    # Check that the old initialization key was stored
    a.old_initialization_key.should eq(old_init_key)
  end
end
