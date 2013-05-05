require 'spec_helper'

describe UsersController do
  before(:each) do
    # Sign in as a user first
    u = User.find_by_id( 1 )
    u.should_not be_nil
    sign_in u
  end
  
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    pending
    # it "returns http success" do
    #       get 'show'
    #       response.should be_success
    #     end
  end

end
