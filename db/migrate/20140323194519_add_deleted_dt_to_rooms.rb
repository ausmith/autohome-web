class AddDeletedDtToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :deleted_at, :datetime, :null => true, :default => nil
  end
end
