class CareerApplication < ActiveRecord::Base
  validates :first_name,   presence: true
  validates :last_name,    presence: true
  validates :email,        presence: true
  validates :phone,        presence: true
  validates :cover_letter, presence: true

  has_attached_file :resume,
  :storage => :s3,
  :bucket => 'mmcdevi1-eastgate',
  :s3_credentials => {
    :access_key_id => ENV['S3_ACCESS_KEY'],
    :secret_access_key => ENV['S3_SECRET_KEY']
  }

  validates_attachment_content_type :resume,
    :content_type => [ 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
