class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
