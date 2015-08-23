class ChangeTypeInProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :type 
    add_column :properties, :property_type, :string
  end
end
