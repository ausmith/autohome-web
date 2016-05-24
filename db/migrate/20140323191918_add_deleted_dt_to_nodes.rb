class AddDeletedDtToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :deleted_at, :datetime, :null => true, :default => nil
  end
end
