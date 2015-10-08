class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :budget_id
      t.decimal :amount, precision: 12, scale: 3

      t.timestamps
    end
  end
end
