class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.integer :sensor_host_id
      t.integer :sensor_type_id

      t.timestamps
    end
  end
end
