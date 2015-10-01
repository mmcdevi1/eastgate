class Approval < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  belongs_to :asset
  has_many :priorities

  scope :not_approved, -> { where(approved: false) }
  scope :approved, -> { where(approved: true) }

  def approval_status
    self.approved == true ? 'Approved' : 'Not Approved'
  end

  def shorten_title
    truncate self.title, length: 35
  end

  def date_approved
    self.updated_at.strftime("%B %-d, %Y")
  end
end
