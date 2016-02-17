class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.integer :asset_id
      t.integer :user_id

      t.timestamps
    end
  end
end
