class Approval < ActiveRecord::Base
  belongs_to :asset
  has_many :priorities

  scope :not_approved, -> { where(approved: false) }
  scope :approved, -> { where(approved: true) }
end
