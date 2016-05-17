class Document < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  include ActionView::Helpers::TextHelper

  belongs_to :folder

  has_many :track_downloads

  if Rails.env.development? || Rails.env.test?
    has_attached_file :uploaded_file
  elsif Rails.env.production?
    has_attached_file :uploaded_file,
    :storage => :s3,
    :bucket => 'eastgate-file-hosting',
    :s3_credentials => {
      :access_key_id => ENV['S3_ACCESS_KEY'],
      :secret_access_key => ENV['S3_SECRET_KEY']
    }
  end

  validates_attachment_presence :uploaded_file
  validates_attachment_content_type :uploaded_file,
    :content_type => [
      'application/zip',
      'application/pdf',
      'application/msword','application/vnd.ms-office','application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation',
      'image/jpg','image/jpeg','image/pjpeg','image/png','image/x-png','image/gif', 'image/tiff'
    ]

  def file_name
    uploaded_file_file_name
  end

  def file_size
    number_to_human_size( self.uploaded_file_file_size, :precision => 2 )
  end

  def time_updated_at
    uploaded_file_updated_at
  end

  def basename
    File.basename( file_name, extname )
  end

  def extname
    # file_name.split('.').last
    File.extname( file_name )
  end

  # Decorators
  def minimize_length
    truncate( self.file_name, length: 30 )
  end
end
