class CareerApplication < ActiveRecord::Base
  validates :first_name,   presence: true
  validates :last_name,    presence: true
  validates :email,        presence: true
  validates :phone,        presence: true
  validates :cover_letter, presence: true

  has_attached_file :resume

  validates_attachment_content_type :resume,
    :content_type => [ 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]

  def self.display_count
    self.count if self.count > 0
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
