class CreateExecutiveTeams < ActiveRecord::Migration
  def change
    create_table :executive_teams do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
