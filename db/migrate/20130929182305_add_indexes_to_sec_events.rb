class AddIndexesToSecEvents < ActiveRecord::Migration
  def change
    add_index :sec_events, :user_id
    add_index :sec_events, :room_id
    add_index :sec_events, :node_id
    add_index :sec_events, :sensor_id
    add_index :sec_events, :sec_event_type_cd
  end
end
