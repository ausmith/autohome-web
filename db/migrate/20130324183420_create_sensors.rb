class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name, :null => false, :length => 64
      t.integer :node_id, :null => false
      t.integer :sensor_type_id, :null => false
      t.integer :starting_pin, :null => false
      t.enum :pin_type, :null => false

      t.timestamps
    end
  end
end
