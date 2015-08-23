class ChangePropertyIdInApprovals < ActiveRecord::Migration
  def change
    remove_column :approvals, :property_id
    add_column :approvals, :asset_id, :integer
  end
end
