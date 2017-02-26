class JobPosting < ActiveRecord::Base
  belongs_to :job_category

  has_many :career_applications
end
