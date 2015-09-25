class AddPercentLeasedToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :percent_leased, :integer
  end
end
