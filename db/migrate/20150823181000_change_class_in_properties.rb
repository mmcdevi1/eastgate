class ChangeClassInProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :class 
    add_column :properties, :property_class, :string
  end
end
