require 'spec_helper'

describe "AccessControls" do
  describe "GET /users_access_controls" do
    it "redirects to login when not logged in" do
      get user_access_controls_path(User.first.to_param)
      response.status.should be(302)
    end

    it "works when logged in" do
      get new_user_session_path
      fill_in 'Email', :with => User.first.email
      fill_in 'Password', :with => 'password'
      click_button 'Sign in'

      get user_access_controls_path(User.first.to_param)
      response.status.should be(200)
    end
  end
end
