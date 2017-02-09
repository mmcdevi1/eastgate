class CreateGeneralContents < ActiveRecord::Migration
  def change
    create_table :general_contents do |t|
      t.string :title
      t.string :content
      t.boolean :is_blurb
      t.integer :section

      t.timestamps
    end
  end
end
