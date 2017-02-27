class AddAttachmentToCareerApplications < ActiveRecord::Migration
  def change
    add_attachment :career_applications, :cover_letter
  end
end
