class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :title
      t.integer :priority
      t.integer :property_id

      t.timestamps
    end
  end
end
