class Asset < ActiveRecord::Base
  has_many :approvals
  has_many :business_plans
  belongs_to :client

  def full_address
    self.address + ', ' + self.state + ', ' + self.city + ', ' + self.zipcode
  end
end
