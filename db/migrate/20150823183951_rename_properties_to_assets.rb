class RenamePropertiesToAssets < ActiveRecord::Migration
  def change
    rename_table :properties, :assets
  end
end
