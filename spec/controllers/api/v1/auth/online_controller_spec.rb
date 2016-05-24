describe Api::V1::Auth::OnlineController do

  let(:valid_attributes) {
    {
    }
  }

  node = nil
  token = nil

  before(:each) do
    node = FactoryGirl.create(:node)
    token = FactoryGirl.create(:rfid_access_control)
    ActionDispatch::Request.any_instance.stub(:remote_ip).and_return('127.0.0.1')
  end

  describe "POST online" do
    it "has full-hand notation" do
      post :online, {
        mac_address: node.mac_address,
        initialization_key: node.initialization_key
      }

      result = assigns(:result)

      result.should_not be_nil
    end

    it "has short-hand notation" do
      post :online, {
        M: node.mac_address,
        I: node.initialization_key
      }

      result = assigns(:result)

      result.should_not be_nil
    end

    it "provides a new one-time key" do
      post :online, {
        M: node.mac_address,
        I: node.initialization_key
      }

      result = assigns(:result)

      result['result']['new_one_time_key'].should_not be_nil
    end

    it "provides a new initialization key" do
      post :online, {
        M: node.mac_address,
        I: node.initialization_key
      }

      result = assigns(:result)

      result['result']['new_initialization_key'].should_not be_nil
    end

    it "creates an NODEONLINESUCCESS audit entry on success" do
      expect {
        post :online, {
          M: node.mac_address,
          I: node.initialization_key
        }
      }.to change(SecEvent, :count).by(1)

      entry = SecEvent.last

      entry.should_not be_nil
      entry.sec_event_type_cd.should eq('NODEONLINESUCCESS')
      entry.node.should eq(node)
    end

    it "creates an NODEONLINEKEYFAIL audit entry when the initialization key is wrong" do
      expect {
        post :online, {
          M: node.mac_address,
          I: 'a'
        }
      }.to change(SecEvent, :count).by(1)

      entry = SecEvent.last

      entry.should_not be_nil
      entry.sec_event_type_cd.should eq('NODEONLINEKEYFAIL')
      entry.node.should eq(node)
    end

    it "creates an NODEONLINEFAIL audit entry when there is an unknown issue" do
      # Forcibly make all nodes fail for this run
      Node.any_instance.stub(:valid?).and_return(false)
      expect {
        post :online, {
          M: node.mac_address,
          I: node.initialization_key
        }
      }.to change(SecEvent, :count).by(1)

      entry = SecEvent.last

      entry.should_not be_nil
      entry.sec_event_type_cd.should eq('NODEONLINEFAIL')
      entry.node.should eq(node)
    end
  end
end
