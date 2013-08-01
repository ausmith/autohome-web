require "spec_helper"

describe AccessControlsController do
  describe "routing" do

    it "routes to #index" do
      get("/users/1/access_controls").should route_to("access_controls#index", :user_id => "1")
    end

    it "routes to #new" do
      get("/users/1/access_controls/new").should route_to("access_controls#new", :user_id => "1")
    end

    it "routes to #show" do
      get("/users/1/access_controls/2").should route_to("access_controls#show", :user_id => "1", :id => "2")
    end

    it "routes to #edit" do
      get("/users/1/access_controls/2/edit").should route_to("access_controls#edit", :user_id => "1", :id => "2")
    end

    it "routes to #create" do
      post("/users/1/access_controls").should route_to("access_controls#create", :user_id => "1")
    end

    it "routes to #update" do
      put("/users/1/access_controls/2").should route_to("access_controls#update", :user_id => "1", :id => "2")
    end

    it "routes to #destroy" do
      delete("/users/1/access_controls/2").should route_to("access_controls#destroy", :user_id => "1", :id => "2")
    end

  end
end
