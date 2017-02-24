class CreateMinimumExperiences < ActiveRecord::Migration
  def change
    create_table :minimum_experiences do |t|
      t.string :title

      t.timestamps
    end
  end
end
