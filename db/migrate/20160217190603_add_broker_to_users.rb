class AddBrokerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :broker, :boolean, default: false
  end
end
