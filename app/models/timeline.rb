class Timeline < ActiveRecord::Base
  belongs_to :asset

  has_attached_file :timeline_doc, styles: {
    thumb: "140x140#"
  }
  # :storage => :s3,
  # :bucket => ENV['LEASIFY'],
  # :s3_credentials => File.join(Rails.root, 'config', 'application.yml')
  validates_attachment_content_type :timeline_doc, :content_type => /\Aimage/
end
