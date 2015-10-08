class AddAmountToBudget < ActiveRecord::Migration
  def change
    add_column :budgets, :amount, :decimal, :precision => 12, :scale => 3
  end
end
