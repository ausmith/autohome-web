require "spec_helper"

describe SensorTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/sensor_types").should route_to("sensor_types#index")
    end

    it "routes to #new" do
      get("/admin/sensor_types/new").should route_to("sensor_types#new")
    end

    it "routes to #show" do
      get("/admin/sensor_types/1").should route_to("sensor_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/sensor_types/1/edit").should route_to("sensor_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/sensor_types").should route_to("sensor_types#create")
    end

    it "routes to #update" do
      put("/admin/sensor_types/1").should route_to("sensor_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/sensor_types/1").should route_to("sensor_types#destroy", :id => "1")
    end

  end
end
