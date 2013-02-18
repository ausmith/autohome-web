require 'spec_helper'

describe User do
  it "cannot be deleted if root" do
    u = User.find_by_id( 1 )
    u.should_not be_nil

    u.destroy
    User.find_by_id( 1 ).should_not be_nil
  end
end
