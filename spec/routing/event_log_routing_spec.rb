require "spec_helper"

describe EventLogController do
  describe "routing" do
    it "routes to #index" do
      get("/admin/event_log").should route_to("event_log#index")
    end
  end
end
