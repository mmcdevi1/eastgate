class Asset < ActiveRecord::Base
  has_many :approvals, :dependent => :destroy
  has_many :business_plans, :dependent => :destroy
  has_many :timelines, :dependent => :destroy
  belongs_to :client

  def full_address
    self.address + ', ' + self.state + ', ' + self.city + ', ' + self.zipcode
  end
end
