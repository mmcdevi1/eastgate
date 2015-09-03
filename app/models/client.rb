class Client < ActiveRecord::Base
  has_many :assets, :dependent => :destroy
  has_many :users, :dependent => :destroy
end
