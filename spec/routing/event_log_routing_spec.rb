require "spec_helper"

describe EventLogController do
  describe "routing" do
    it "routes to #index" do
      get("/admin/event_log").should route_to("event_log#index")
    end

    it "routes to #show" do
      get("/admin/event_log/1").should route_to("event_log#show", :id => "1")
    end
  end
end
