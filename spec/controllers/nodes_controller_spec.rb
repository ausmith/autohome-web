###############################################################################
# This file is part of The Autohome Project.
#
# The Autohome Project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Autohome Project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with The Autohome Project.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

require 'spec_helper'

describe NodesController do
  before(:each) do
    # Sign in as a user first
    u = User.find_by_id( 1 )
    u.should_not be_nil
    sign_in u
  end

  # This should return the minimal set of attributes required to create a valid
  # Node. As you add validations to Node, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "mac_address" => "AA:BB:CC:DD:EE:FF",
      "status" => Node.status().values[Random.rand(Node.status().size)],
      "take_offline" => false,
      "room_ids" => [FactoryGirl.create(:room).id] }
  end

  describe "GET index" do
    it "assigns all nodes as @nodes" do
      node = Node.create! valid_attributes
      get :index, {}
      assigns(:nodes).should eq([node])
    end
  end

  describe "GET show" do
    it "assigns the requested node as @node" do
      node = Node.create! valid_attributes
      get :show, {:id => node.to_param}
      assigns(:node).should eq(node)
    end
  end

  describe "GET new" do
    it "assigns a new node as @node" do
      get :new, {}
      assigns(:node).should be_a_new(Node)
    end
  end

  describe "GET edit" do
    it "assigns the requested node as @node" do
      node = Node.create! valid_attributes
      get :edit, {:id => node.to_param}
      assigns(:node).should eq(node)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Node" do
        expect {
          post :create, {:node => valid_attributes}
        }.to change(Node, :count).by(1)
      end

      it "creates a new NODECREATE audit entry" do
        expect {
          post :create, {:node => valid_attributes}
        }.to change(SecEvent, :count).by(1)
        expect(SecEvent.last.sec_event_type_cd).to eq('NODECREATE')
        expect(SecEvent.last.node_id).to eq(Node.last.id)
      end

      it "assigns a newly created node as @node" do
        post :create, {:node => valid_attributes}
        assigns(:node).should be_a(Node)
        assigns(:node).should be_persisted
      end

      it "redirects to the created node" do
        post :create, {:node => valid_attributes}
        response.should redirect_to(Node.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved node as @node" do
        # Trigger the behavior that occurs when invalid params are submitted
        Node.any_instance.stub(:save).and_return(false)
        post :create, {:node => { "mac_address" => "invalid value" }}
        assigns(:node).should be_a_new(Node)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Node.any_instance.stub(:save).and_return(false)
        post :create, {:node => { "mac_address" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested node" do
        node = Node.create! valid_attributes
        # Assuming there are no other nodes in the database, this
        # specifies that the Node created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Node.any_instance.should_receive(:update_attributes).with({ "mac_address" => "MyString" })
        put :update, {:id => node.to_param, :node => { "mac_address" => "MyString" }}
      end

      it "creates a new NODEUPDATE audit entry" do
        node = Node.create! valid_attributes
        # Assuming there are no other nodes in the database, this
        # specifies that the Node created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect {
          put :update, {:id => node.to_param, :node => { "mac_address" => "MyString" }}
        }.to change(SecEvent, :count).by(1)
        expect(SecEvent.last.sec_event_type_cd).to eq('NODEUPDATE')
        expect(SecEvent.last.node_id).to eq(Node.last.id)
      end

      it "assigns the requested node as @node" do
        node = Node.create! valid_attributes
        put :update, {:id => node.to_param, :node => valid_attributes}
        assigns(:node).should eq(node)
      end

      it "redirects to the node" do
        node = Node.create! valid_attributes
        put :update, {:id => node.to_param, :node => valid_attributes}
        response.should redirect_to(node)
      end
    end

    describe "with invalid params" do
      it "assigns the node as @node" do
        node = Node.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Node.any_instance.stub(:save).and_return(false)
        put :update, {:id => node.to_param, :node => { "mac_address" => "invalid value" }}
        assigns(:node).should eq(node)
      end

      it "re-renders the 'edit' template" do
        node = Node.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Node.any_instance.stub(:save).and_return(false)
        put :update, {:id => node.to_param, :node => { "mac_address" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "soft-deletes the requested node" do
      node = Node.create! valid_attributes
      expect {
        delete :destroy, {:id => node.to_param}
      }.to change(Node.available, :count).by(-1)
    end

    it "does not destroy the requested node" do
      node = Node.create! valid_attributes
      expect {
        delete :destroy, {:id => node.to_param}
      }.to change(Node, :count).by(0)
    end

    it "creates a new NODEDELETE audit entry" do
      node = Node.create! valid_attributes
      # Assuming there are no other nodes in the database, this
      # specifies that the Node created on the previous line
      # receives the :update_attributes message with whatever params are
      # submitted in the request.
      expect {
        delete :destroy, {:id => node.to_param}
      }.to change(SecEvent, :count).by(1)
      expect(SecEvent.last.sec_event_type_cd).to eq('NODEDELETE')
      expect(SecEvent.last.node_id).to eq(Node.last.id)
    end

    it "redirects to the nodes list" do
      node = Node.create! valid_attributes
      delete :destroy, {:id => node.to_param}
      response.should redirect_to(nodes_url)
    end
  end

end
