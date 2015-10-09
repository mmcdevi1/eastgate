class Approval < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

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

  def time_in_words
    time_ago_in_words self.created_at
  end

  def priority
    Priority.title(self)[0]
  end
end
