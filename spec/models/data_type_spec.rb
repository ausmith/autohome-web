require 'spec_helper'

describe DataType do
  it "has a valid Factory" do
    FactoryGirl.build(:data_type).should be_valid
  end

  it "has a valid longhand name" do
    # Pass a syntactically valid one
    FactoryGirl.build(:data_type).should be_valid

    # Blank name
    FactoryGirl.build(:data_type, :longhand_unit => '').should_not be_valid

    # Too long of a name (33+ characters)
    FactoryGirl.build(:data_type, :longhand_unit => '123456789012345678901234567890123').should_not be_valid
  end

  it "has a valid shorthand name" do
    # Pass a syntactically valid one
    FactoryGirl.build(:data_type).should be_valid

    # Blank name
    FactoryGirl.build(:data_type, :shorthand_unit => '').should_not be_valid

    # Too long of a name (33+ characters)
    FactoryGirl.build(:data_type, :shorthand_unit => '123456789012345678901234567890123').should_not be_valid
  end
end
