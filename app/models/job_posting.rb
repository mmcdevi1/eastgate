class JobPosting < ActiveRecord::Base
  belongs_to :job_category

  has_many :career_applications

  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }
end
