class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points, {:id => false} do |t|
      t.integer :node_id
      t.integer :sensor_id
      t.string :value

      t.timestamps
    end
    add_index :data_points, [:node_id, :sensor_id], :unique => false
    add_index :data_points, [:sensor_id, :created_at], :unique => true
  end
end
