class CreateTrackDownloads < ActiveRecord::Migration
  def change
    create_table :track_downloads do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
