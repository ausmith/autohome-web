class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :mac_address, :length => 17, :null => false
      t.string :ip_address, :length => 15, :null => true
      t.integer :status, :null => false
      t.boolean :take_offline, :default => false
      t.datetime :last_online, :null => true, :default => :nil
      t.integer :room_id

      t.timestamps
    end
  end
end
