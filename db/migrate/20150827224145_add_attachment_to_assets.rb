class AddAttachmentToAssets < ActiveRecord::Migration
  def change
    add_attachment :assets, :asset_image
  end
end
