class RemoveIsInvestorsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_investors
    add_column :users, :is_investor, :boolean, default: false
  end
end
