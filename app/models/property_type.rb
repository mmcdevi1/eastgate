class PropertyType < ActiveRecord::Base

  scope :title, -> (asset) { where(id: asset.property_type).first.title }

end
