class CareerApplication < ActiveRecord::Base
  belongs_to :job_posting

  validates :first_name,   presence: true
  validates :last_name,    presence: true
  validates :email,        presence: true
  # validates :phone,        presence: true
  # validates :cover_letter, presence: true

  if Rails.env.development? || Rails.env.test?
    has_attached_file :resume
  elsif Rails.env.production?
    has_attached_file :resume,
    :storage => :s3,
    :bucket => 'eastgate-file-hosting',
    :s3_credentials => {
      :access_key_id => ENV['S3_ACCESS_KEY'],
      :secret_access_key => ENV['S3_SECRET_KEY']
    }
  end

  validates_attachment_content_type :resume,
    :content_type => [ 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]

  def self.display_count
    self.count if self.count > 0
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
