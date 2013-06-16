class CreateUsersAccessControls < ActiveRecord::Migration
  def change
    create_table :access_controls do |t|
      t.integer :access_control_type_id
      t.integer :user_id
      t.string :value
      t.string :description
      t.boolean :enabled

      t.timestamps
    end
  end
end
