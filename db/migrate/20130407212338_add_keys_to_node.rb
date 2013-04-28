class AddKeysToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :initialization_key, :string, :length => 32
    add_column :nodes, :one_time_key, :string, :length => 32
  end
end
