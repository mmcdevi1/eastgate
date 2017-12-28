class AddIsInvestorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_investors, :boolean, default: false
  end
end
