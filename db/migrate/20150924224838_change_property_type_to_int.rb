class ChangePropertyTypeToInt < ActiveRecord::Migration
  def change
    change_column :assets, :property_type, :integer
  end
end
