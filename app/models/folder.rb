require 'zip'

class Folder < ActiveRecord::Base
  extend ActsAsTree::TreeView
  extend ActsAsTree::TreeWalker

  include Rails.application.routes.url_helpers

  acts_as_tree order: 'name'

  has_many :documents, :dependent => :destroy

  belongs_to :asset

  def is_root?
    ancestors.empty?
  end

  def is_empty?
    !is_root?
  end

  def redirect(asset)
    if self.is_root?
      admin_asset_folders_path(asset)
    else
      admin_asset_folder_path(asset, self.ancestors.first)
    end
  end

  def folder_size
    self.documents.map { |document| document.uploaded_file_file_size }.inject(:+)
  end

  def totally_empty?
    self.children.empty? && self.documents.empty?
  end

  # def zip
  #   Zip::OutputStream.open('exampleout.zip') do |zos|
  #     zos.put_next_entry('the first little entry.rb')
  #     zos.puts 'Hello hello hello hello hello hello hello hello hello'

  #     zos.put_next_entry('the second little entry')
  #     zos.puts 'Hello again'
  #   end
  # end
end
