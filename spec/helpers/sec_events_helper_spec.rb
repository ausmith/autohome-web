require 'spec_helper'
include SecEventsHelper

describe SecEventsHelper do
  before(:each) do
    allow_message_expectations_on_nil
    request.stub(:remote_ip).and_return('127.0.0.1')
  end

  describe "create_audit(options={}}" do
    it "can take a type and nothing else" do
      expect{
        create_audit('NODECREATE')
      }.to change(SecEvent, :count).by(1)
    end
  end
end
