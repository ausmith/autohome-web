class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, :length => 128, :unique => true, :null => false

      t.timestamps
    end
  end
end
