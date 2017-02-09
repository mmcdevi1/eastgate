class AddIsMemberToExecutiveTeams < ActiveRecord::Migration
  def change
    add_column :executive_teams, :is_member, :boolean
  end
end
