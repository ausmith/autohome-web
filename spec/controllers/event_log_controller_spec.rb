require 'spec_helper'

describe EventLogController do
  def get_admin_user
    @u = User.find_by_id( 1 )
    @u.should_not be_nil
  end

  def login
    get_admin_user
    # Sign in as a user first
    sign_in @u
  end

  def create_event
    get_admin_user
    SecEvent.create! valid_attributes
  end

  def valid_attributes
    {
      sec_event_type_cd: :LOGINPASS,
      user_id: @u.id,
      ip: '127.0.0.1'
    }
  end

  describe "GET 'index'" do
    it "redirects when not logged in" do
      get 'index'
      response.should redirect_to(new_user_session_url)
    end

    it "throws a 403 when the user is not admin" do
      user = FactoryGirl.create(:regular_user)
      user.confirm!
      sign_in :user, user

      expect {
        get 'index'
      }.to raise_error(ApplicationController::ForbiddenException)
    end

    it "returns http success" do
      login
      sec_event = SecEvent.create! valid_attributes
      get 'index'
      assigns(:events).should eq([sec_event])
      response.should be_success
      response.code.should eq("200")
    end
  end

  describe "GET 'show'" do
    it "redirects when not logged in" do
      sec_event = create_event
      get 'show', id: sec_event.id
      response.should redirect_to(new_user_session_url)
    end

    it "throws a 403 when the user is not admin" do
      user = FactoryGirl.create(:regular_user)
      user.confirm!
      sign_in :user, user

      sec_event = create_event

      expect {
        get 'show', id: sec_event.id
      }.to raise_error(ApplicationController::ForbiddenException)
    end

    it "returns http success" do
      sec_event = create_event
      login
      get 'show', id: sec_event.id
      assigns(:event).should eq(sec_event)
      response.should be_success
      response.code.should eq("200")
    end
  end

end
