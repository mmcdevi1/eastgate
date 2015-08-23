class Asset < ActiveRecord::Base
  has_many :approvals

  def full_address
    self.address + ', ' + self.state + ', ' + self.city + ', ' + self.zipcode
  end
end
