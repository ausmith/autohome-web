class CreateSensorHosts < ActiveRecord::Migration
  def change
    create_table :sensor_hosts do |t|
      t.string :ip_address
      t.string :mac_address
      t.string :authorization_key
      t.string :location
      t.datetime :last_online

      t.timestamps
    end
  end
end
