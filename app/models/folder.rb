class Folder < ActiveRecord::Base
  extend ActsAsTree::TreeView

  acts_as_tree order: 'name'

  has_many :documents, :dependent => :destroy

  belongs_to :asset
end
