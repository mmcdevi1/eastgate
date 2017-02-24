class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :title
      t.string :location
      t.text :description
      t.integer :job_category_id
      t.integer :employment_type
      t.integer :minimum_experience

      t.timestamps
    end
  end
end
