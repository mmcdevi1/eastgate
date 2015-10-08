class Budget < ActiveRecord::Base
  belongs_to :asset

  has_many :credits, :dependent => :destroy
  has_many :debits,  :dependent => :destroy
end
