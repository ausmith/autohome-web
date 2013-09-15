class CreateSecEventTypes < ActiveRecord::Migration
  def change
    create_table :sec_event_types do |t|
      t.string :description, :length => 255, :null => false, :unique => true

      t.timestamps
    end
  end
end
