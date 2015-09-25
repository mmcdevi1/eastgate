class ChangePropertyClassToInt < ActiveRecord::Migration
  def change
    change_column :assets, :property_class, :integer
  end
end
