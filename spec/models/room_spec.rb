require 'spec_helper'

describe Room do
  it "must have unique room names" do
    FactoryGirl.create(:room, :name => 'Duplicate').should be_valid
    FactoryGirl.build(:room, :name => 'Duplicate').should_not be_valid
  end

  it "must have a room name of at least 2 characters" do
    FactoryGirl.build(:room, :name => '1').should_not be_valid
    FactoryGirl.build(:room, :name => '12').should be_valid
    FactoryGirl.build(:room, :name => '123').should be_valid
  end

  it "must have a room name no longer than 128 characters" do
    FactoryGirl.build(:room, :name => (0...127).map{65.+(rand(26)).chr}.join).should be_valid
    FactoryGirl.build(:room, :name => (0...128).map{65.+(rand(26)).chr}.join).should be_valid
    FactoryGirl.build(:room, :name => (0...129).map{65.+(rand(26)).chr}.join).should_not be_valid
    FactoryGirl.build(:room, :name => (0...130).map{65.+(rand(26)).chr}.join).should_not be_valid
  end

  it "must have a room name that exists" do
    FactoryGirl.build(:room, :name => nil).should_not be_valid
    FactoryGirl.build(:room, :name => "").should_not be_valid
  end

  it "can soft delete itself" do
    r = FactoryGirl.create(:room)
    r.deleted_at.should be_nil
    r.soft_delete
    r.deleted_at.should_not be_nil
  end
end
