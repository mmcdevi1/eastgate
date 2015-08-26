class BusinessPlan < ActiveRecord::Base
  belongs_to :asset
  has_attached_file :business_plan_doc, styles: {
    thumb: "140x140#"
  }
  # :storage => :s3,
  # :bucket => ENV['LEASIFY'],
  # :s3_credentials => File.join(Rails.root, 'config', 'application.yml')
  validates_attachment :business_plan_doc, content_type: { content_type: "application/pdf" }
end
