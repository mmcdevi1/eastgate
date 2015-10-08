class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :asset_id

      t.timestamps
    end
  end
end
