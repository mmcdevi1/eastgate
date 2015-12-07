class ChangePropertyTypeToInt < ActiveRecord::Migration
  def change
    change_column :assets, :property_type, 'integer USING CAST(property_type AS integer)'
  end
end
