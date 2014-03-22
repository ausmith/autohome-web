require 'spec_helper'

describe SessionsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    u = User.find_by_id( 1 )
    u.should_not be_nil
  end

  describe "GET sign_in" do
    it "exists" do
      get :new, {}
    end
  end

  describe "POST sign_in" do
    it "signs in a user with a good email and password" do
      u = User.find_by_id( 1 )

      expect {
        post :create, {:user => {:email => u.email, :password => 'password'} }
      }.to change(SecEvent, :count).by(1)

      response.status.should eq(302)
      response.should redirect_to('/')
      response.should contain("You are being redirected.")

      event = SecEvent.last

      event.sec_event_type_cd.should eq('LOGINPASS')
      event.user_id.should eq(u.id)
    end

    it "fails to sign in a user with a good email and bad password" do
      u = User.find_by_id( 1 )

      expect {
        post :create, {:user => {:email => u.email, :password => 'password2'} }
      }.to change(SecEvent, :count).by(1)

      response.status.should eq(200)
      response.should_not redirect_to('/')

      event = SecEvent.last

      event.sec_event_type_cd.should eq('LOGINFAIL')
      event.user_id.should eq(u.id)
    end

    it "fails to sign in a user with a bad email" do
      expect {
        post :create, {:user => {:email => 'dne@example.com', :password => 'password2'} }
      }.to change(SecEvent, :count).by(1)

      response.status.should eq(200)
      response.should_not redirect_to('/')

      event = SecEvent.last

      event.sec_event_type_cd.should eq('LOGINDNE')
      event.user_id.should be_nil
      event.description.should eq('dne@example.com')
    end
  end
end
