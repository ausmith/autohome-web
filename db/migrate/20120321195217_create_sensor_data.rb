class CreateSensorData < ActiveRecord::Migration
  def change
    create_table :sensor_data do |t|
      t.integer :sensor_id
      t.float :value

      t.timestamps
    end
  end
end
