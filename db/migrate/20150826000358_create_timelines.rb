class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :asset_id

      t.timestamps
    end
    add_attachment :timelines, :timeline_doc
  end
end
