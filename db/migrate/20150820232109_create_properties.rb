class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :summary
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :type
      t.string :class
      t.string :year_built
      t.integer :size

      t.timestamps
    end
  end
end
