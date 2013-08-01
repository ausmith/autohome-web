require 'spec_helper'

describe AccessControl do
  it "has a valid factory" do
    FactoryGirl.build(:access_control).should be_valid
  end

  it "belongs to an access control type" do
    # Remove the access control type
    FactoryGirl.build(:access_control, :access_control_type => nil).
      should_not be_valid
  end

  it "belongs to a user" do
    # Remove the user
    FactoryGirl.build(:access_control, :user => nil).
      should_not be_valid
  end

  it "has a valid description" do
    a = FactoryGirl.build(:access_control)
    a.should be_valid

    a.description = ''
    a.should_not be_valid

    a.description = nil
    a.should_not be_valid

    a.description = 'a'
    a.should_not be_valid

    a.description = '12345678901234567890123456789012345678901234567890' + 
      '123456789012345'
    a.should_not be_valid
  end

  it "has a valid value" do
    a = FactoryGirl.build(:access_control)
    a.should be_valid

    a.value = ''
    a.should_not be_valid

    a.value = nil
    a.should_not be_valid

    a.value = 'a'
    a.should be_valid

    a.value = '12345678901234567890123456789012345678901234567890' + 
              '123456789012345678901234567890123456789012345678901' 
    a.should_not be_valid
  end
end
