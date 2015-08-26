class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :asset_id
      t.string :title

      t.timestamps
    end
    add_attachment :images, :property_image
  end
end
