class Folder < ActiveRecord::Base
  acts_as_tree
  
  has_many :documents, :dependent => :destroy

  belongs_to :asset
end
