class JobCategory < ActiveRecord::Base
  has_many :job_postings

  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }
end
