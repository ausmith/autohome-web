require "spec_helper"

describe DataTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/data_types").should route_to("data_types#index")
    end

    it "routes to #new" do
      get("/admin/data_types/new").should route_to("data_types#new")
    end

    it "routes to #show" do
      get("/admin/data_types/1").should route_to("data_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/data_types/1/edit").should route_to("data_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/data_types").should route_to("data_types#create")
    end

    it "routes to #update" do
      put("/admin/data_types/1").should route_to("data_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/data_types/1").should route_to("data_types#destroy", :id => "1")
    end

  end
end
