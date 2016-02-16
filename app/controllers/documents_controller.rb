class DocumentsController < HatchesController
  before_action :correct_client

  def get
    document = Document.find_by_id(params[:id])
    if Rails.env.development?
      if document
        send_file document.uploaded_file.path, :type => document.uploaded_file_content_type
      end
    else
      if document
        data = open( URI.parse( URI.encode( document.uploaded_file.url ) ) )
        send_data data, :filename => document.uploaded_file_file_name
      end
    end
  end

end
