class Asset < ActiveRecord::Base
  has_many :approvals, :dependent => :destroy
  has_many :business_plans, :dependent => :destroy
  has_many :timelines, :dependent => :destroy
  belongs_to :client

  has_attached_file :asset_image, :default_url => "/newyorker-main.jpg", styles: {
    xlarge: "1200x800#",
    large: "1200x800#",
    medium: "300x300#",
    small: "50x50#",
    thumb: "140x140#"
  }
  validates_attachment_content_type :asset_image, :content_type => /\Aimage/

  def full_address
    self.address + ', ' + self.state + ', ' + self.city + ', ' + self.zipcode
  end
end
