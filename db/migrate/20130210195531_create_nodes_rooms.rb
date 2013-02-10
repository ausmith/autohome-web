class CreateNodesRooms < ActiveRecord::Migration
  def change
    create_table :nodes_rooms do |t|
      t.integer :room_id, :null => false
      t.integer :node_id, :null => false
    end
  end
end
