class AddDescriptionToApprovals < ActiveRecord::Migration
  def change
    add_column :approvals, :description, :text
    add_column :approvals, :user_id, :integer
  end
end
