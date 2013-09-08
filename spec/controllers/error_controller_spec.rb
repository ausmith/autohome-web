require 'spec_helper'

describe ErrorController do
  describe "error_403" do
    it "triggers a 403 error" do
      get :error_403
      expect( response.status ).to eq( 403 )
    end
  end
  
  describe "error_404" do
    it "triggers a 404 error" do
      get :error_404
      expect( response.status ).to eq( 404 )
    end
  end
  
  describe "error_500" do
    it "triggers a 500 error" do
      get :error_500
      expect( response.status ).to eq( 500 )
    end
  end
end
