class AddClientIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :client_id, :integer
  end
end
