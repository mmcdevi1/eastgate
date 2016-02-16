class Folder < ActiveRecord::Base
  extend ActsAsTree::TreeView
  include Rails.application.routes.url_helpers

  acts_as_tree order: 'name'

  has_many :documents, :dependent => :destroy

  belongs_to :asset

  def is_root?
    ancestors.empty?
  end

  def redirect(asset)
    if self.is_root?
      admin_asset_folders_path(asset)
    else
      admin_asset_folder_path(asset, self.ancestors.first)
    end
  end
end
