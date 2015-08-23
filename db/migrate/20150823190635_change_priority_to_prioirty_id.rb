class ChangePriorityToPrioirtyId < ActiveRecord::Migration
  def change
    rename_column :approvals, :priority, :priority_id
  end
end
