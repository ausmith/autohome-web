class AddShortAndLongNamesToDataTypes < ActiveRecord::Migration
  def up
    change_column :data_types, :unit, :string, :length => 8, :null => false
    change_column :data_types, :name, :string, :length => 32, :null => false
    rename_column :data_types, :unit, :shorthand_unit
    rename_column :data_types, :name, :longhand_unit
  end

  def down
    rename_column :data_types, :shorthand_unit, :unit
    rename_column :data_types, :longhand_unit, :name
    change_column :data_types, :unit, :string, :length => nil, :null => nil
    change_column :data_types, :name, :string, :length => nil, :null => nil
  end
end
