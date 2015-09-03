class ChangeSummaryToTextToAsset < ActiveRecord::Migration
  def change
    change_column :assets, :summary, :text
  end
end
