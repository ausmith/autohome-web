class CreateSecEvents < ActiveRecord::Migration
  def change
    create_table :sec_events do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :node_id
      t.integer :sensor_id
      t.string :sec_event_type_cd, :null => false
      t.string :description, :length => 255
      t.string :ip, :length => 45, :null => false

      t.timestamps
    end
  end
end
