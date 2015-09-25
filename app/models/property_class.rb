class PropertyClass < ActiveRecord::Base

  scope :title, -> (asset) { where(id: asset.property_class).first.title }

end
