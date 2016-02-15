class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :asset_id
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
