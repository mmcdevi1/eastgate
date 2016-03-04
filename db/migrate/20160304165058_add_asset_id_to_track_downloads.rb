class AddAssetIdToTrackDownloads < ActiveRecord::Migration
  def change
    add_column :track_downloads, :asset_id, :integer
  end
end
