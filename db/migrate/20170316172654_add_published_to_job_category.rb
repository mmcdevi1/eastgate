class AddPublishedToJobCategory < ActiveRecord::Migration
  def change
    add_column :job_categories, :published, :boolean
  end
end
