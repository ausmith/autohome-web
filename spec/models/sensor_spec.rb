require 'spec_helper'

describe Sensor do
  it "has a valid Factory" do
    FactoryGirl.build(:sensor).should be_valid
  end

  it { should belong_to(:sensor_type) }

  it "should have a valid Node" do
    # Cannot be null
    FactoryGirl.build(:sensor, :node => nil).should_not be_valid

    # Cannot be negative
    FactoryGirl.build(:sensor, :node_id => -1).should_not be_valid

    # Get a value that does not exist
    n = Node.last
    n_id = ( n != nil ? n.id + 1 : 1 ) # Either increment the last ID by 1, or just use 1
    FactoryGirl.build(:sensor, :node_id => n_id).should_not be_valid
  end

  it { should belong_to(:node) }

  it "should have a valid Sensor Type" do
    # Cannot be null
    FactoryGirl.build(:sensor, :sensor_type => nil).should_not be_valid

    # Cannot be negative
    FactoryGirl.build(:sensor, :sensor_type_id => -1).should_not be_valid

    # Get a value that does not exist
    n = SensorType.last
    n_id = ( n != nil ? n.id + 1 : 1 ) # Either increment the last ID by 1, or just use 1
    FactoryGirl.build(:sensor, :sensor_type_id => n_id).should_not be_valid
  end

  it "should have a valid name" do
    # Cannot be null
    FactoryGirl.build(:sensor, :name => nil).should_not be_valid

    # Cannot be less than 2 characters long
    FactoryGirl.build(:sensor, :name => '')
    FactoryGirl.build(:sensor, :name => '1').should_not be_valid
    FactoryGirl.build(:sensor, :name => '12').should be_valid

    # Cannot be more than 64 characters long
    str = ''
    64.times do
      str = str + 'a'
    end
    FactoryGirl.build(:sensor, :name => str).should be_valid

    str = str + 'a'
    FactoryGirl.build(:sensor, :name => str).should_not be_valid
  end

  it "should have a valid starting pin" do
    FactoryGirl.build(:sensor, :starting_pin => nil).should_not be_valid
    FactoryGirl.build(:sensor, :starting_pin => -1).should_not be_valid
    FactoryGirl.build(:sensor, :starting_pin => 0).should be_valid
  end

  it "should have a valid pin type" do
    FactoryGirl.build(:sensor, :pin_type => nil).should_not be_valid
    FactoryGirl.build(:sensor, :pin_type => 'Digital').should be_valid
    FactoryGirl.build(:sensor, :pin_type => 'Analog').should be_valid
  end

end
