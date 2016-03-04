class AddFolderToTrackDownloads < ActiveRecord::Migration
  def change
    add_column :track_downloads, :folder, :boolean
    add_column :track_downloads, :document_id, :integer
  end
end
