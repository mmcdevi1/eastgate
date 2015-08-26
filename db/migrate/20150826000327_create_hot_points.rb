class CreateHotPoints < ActiveRecord::Migration
  def change
    create_table :hot_points do |t|
      t.string :title
      t.integer :asset_id

      t.timestamps
    end
  end
end
