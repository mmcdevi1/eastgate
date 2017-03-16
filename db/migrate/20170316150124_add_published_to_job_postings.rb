class AddPublishedToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :published, :boolean, default: false
  end
end
