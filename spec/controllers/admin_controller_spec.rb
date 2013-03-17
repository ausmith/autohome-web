require 'spec_helper'

describe AdminController do
  it "redirects to the sign_in page when not logged in" do
    # We're not signed in; redirect
    get 'index'
    response.status.should be(302)
  end

  it "returns http success when logged in" do
    # Get user, and sign them in
    @user = User.find_by_id( 1 )
    @user.should_not be_nil
    sign_in @user

    # Navigate to page
    get 'index'
    response.status.should be(200)
  end

end
