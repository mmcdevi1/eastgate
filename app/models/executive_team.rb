class ExecutiveTeam < ActiveRecord::Base
  scope :is_member, -> { where(is_member: true) }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def modal_id
    "#{self.first_name.downcase}_#{self.last_name.downcase.gsub(/[^a-zA-Z]/, '')}_#{self.id}"
  end
end
