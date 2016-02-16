class Document < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :folder

  has_attached_file :uploaded_file
  validates_attachment_presence :uploaded_file
  validates_attachment_content_type :uploaded_file,
    :content_type => [ 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]

  def file_name
    uploaded_file_file_name
  end

  def file_size
    number_to_human_size( self.uploaded_file_file_size, :precision => 2 )
  end
end
