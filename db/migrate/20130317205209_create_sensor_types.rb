class CreateSensorTypes < ActiveRecord::Migration
  def change
    create_table :sensor_types do |t|
      t.string :name
      t.text :description
      t.integer :data_type_id
      t.integer :pins_used
      t.string :library_file

      t.timestamps
    end
  end
end
