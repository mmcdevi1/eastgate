class Client < ActiveRecord::Base
  has_many :assets
  has_many :users
end
