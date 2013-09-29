class CreateSecEventTypes < ActiveRecord::Migration
  def change
    create_table :sec_event_types, id: false do |t|
      t.string :type_cd, :length => 10, :null => false, :unique => true
      t.string :description, :length => 255, :null => false, :unique => true


      t.timestamps
    end
    add_index :sec_event_types, :type_cd, :unique => true
    add_index :sec_event_types, :description

  end
end
