require 'spec_helper'

describe SensorType do
  it "has a valid Factory" do
    FactoryGirl.build(:sensor_type).should be_valid
  end

  it "has a valid name" do
    # Pass a syntactically valid one
    FactoryGirl.build(:sensor_type).should be_valid

    # Blank
    FactoryGirl.build(:sensor_type, :name => '').should_not be_valid

    # Too short
    FactoryGirl.build(:sensor_type, :name => 'a').should_not be_valid
    
    # Too long
    FactoryGirl.build(:sensor_type, :name => '123456789012345678901234567890123').should_not be_valid
  end

  it "has a valid data type" do
    FactoryGirl.build(:sensor_type).should be_valid

    # No Data Type
    FactoryGirl.build(:sensor_type, :data_type => nil).should_not be_valid
  end

  it "has a valid number of pins" do
    # Pass a syntactically-correct one first
    FactoryGirl.build(:sensor_type).should be_valid

    # Minimum requirement
    FactoryGirl.build(:sensor_type, :pins_used => 0).should be_valid
    FactoryGirl.build(:sensor_type, :pins_used => 1).should be_valid

    # Can't be negative
    FactoryGirl.build(:sensor_type, :pins_used => -1).should_not be_valid
  end

  it "has a valid Ruby library file" do
    # Pass a syntactically-correct one first
    FactoryGirl.build(:sensor_type).should be_valid

    # Blank library file
    FactoryGirl.build(:sensor_type, :library_file => nil).should_not be_valid
    FactoryGirl.build(:sensor_type, :library_file => '').should_not be_valid

    # At least 4 characters
    FactoryGirl.build(:sensor_type, :library_file => '.rb').should_not be_valid

    # At most 64 characters
    FactoryGirl.build(:sensor_type, :library_file => '12345678901234567890123456789012345678901234567890123456789012.rb').should_not be_valid

    # Syntactically incorrect
    FactoryGirl.build(:sensor_type, :library_file => 'aoeunth').should_not be_valid
    FactoryGirl.build(:sensor_type, :library_file => 'a.rboeunth').should_not be_valid
  end


end
