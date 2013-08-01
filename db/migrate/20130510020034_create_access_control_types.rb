class CreateAccessControlTypes < ActiveRecord::Migration
  def change
    create_table :access_control_types do |t|
      t.string :name

      t.timestamps
    end

    AccessControlType.create(:name => 'RFID Tag')
    AccessControlType.create(:name => 'PIN')
    AccessControlType.create(:name => 'Password')
  end
end
