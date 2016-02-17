class Asset < ActiveRecord::Base
  include ApplicationHelper
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper

  has_many :approvals,      :dependent => :destroy
  has_many :business_plans, :dependent => :destroy
  has_many :timelines,      :dependent => :destroy
  has_many :folders,        :dependent => :destroy

  has_many :users, through: :brokers
  has_many :brokers

  has_one  :budget, :dependent => :destroy

  belongs_to :client

  if Rails.env.development? || Rails.env.test?
    has_attached_file :asset_image, :default_url => "/newyorker-main.jpg", styles: {
      xlarge: "1200x800#",
      large: "1200x800#",
      medium: "300x300#",
      thumb: "120x120#",
      small: "50x50#"
    }
  elsif Rails.env.production?
    has_attached_file :asset_image, :default_url => "/newyorker-main.jpg", styles: {
      xlarge: "1200x800#",
      large: "1200x800#",
      medium: "300x300#",
      thumb: "120x120#",
      small: "50x50#"
    },
    :storage => :s3,
    :bucket => 'eastgate-file-hosting',
    :s3_credentials => {
      :access_key_id => ENV['S3_ACCESS_KEY'],
      :secret_access_key => ENV['S3_SECRET_KEY']
    }
  end
  validates_attachment_content_type :asset_image, :content_type => /\Aimage/

  def full_address
    self.address + ', ' + self.city + ', ' + self.state + ', ' + self.zipcode
  end

  def address_with_break
    simple_format(self.address + "\n" + self.city + ', ' + self.state + ', ' + self.zipcode)
  end

  def format_markdown
    markdown(self.summary)
  end

  def building_type
    PropertyType.title(self)
  end

  def building_class
    PropertyClass.title(self)
  end

  def size_to_delimeter
    number_with_delimiter self.size, delimeter: ','
  end

  def need_approvals_count
    self.approvals.not_approved.count
  end

  def approved_count
    self.approvals.approved.count
  end

  def last_approval_item
    self.approvals.not_approved.last.title
  end

  def first_approval_item
    self.approvals.approved.first.title
  end

  def any_approvals?
    self.approvals.not_approved.any?
  end

  def any_approvals_approved?
    self.approvals.approved.any?
  end

  def budget_amount
    number_to_currency self.budget.amount
  end

  def has_broker?(current_user)
    !self.brokers.where(user_id: current_user.id).empty?
  end

  def no_brokers?(current_user)
    !self.has_broker?(current_user)
  end
end
































