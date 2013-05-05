class AddIndicesToSensors < ActiveRecord::Migration
  def change
    add_index :sensors, [:node_id, :starting_pin], :unique => true
  end
end
