class ChangePropertyClassToInt < ActiveRecord::Migration
  def change
    change_column :assets, :property_class, 'integer USING CAST(property_class AS integer)'
  end
end
