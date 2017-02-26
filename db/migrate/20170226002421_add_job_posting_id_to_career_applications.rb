class AddJobPostingIdToCareerApplications < ActiveRecord::Migration
  def change
    add_column :career_applications, :job_posting_id, :integer
  end
end
