class Priority < ActiveRecord::Base
  belongs_to :approval

  scope :title, -> (approval) { where(id: approval.priority_id).first.title }
end
