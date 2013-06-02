class AddSoftDeleteTagToUser < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :datetime, :null => true, :default => nil
  end
end
