class CreatePropertyClasses < ActiveRecord::Migration
  def change
    create_table :property_classes do |t|
      t.string :title

      t.timestamps
    end
  end
end
