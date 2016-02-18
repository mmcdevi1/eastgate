require 'zip'

class DocumentsController < HatchesController
  before_action :correct_client

  def get
    document = Document.find_by_id(params[:id])
    if Rails.env.development?
      if document
        send_file( document.uploaded_file.path, :type => document.uploaded_file_content_type )
      end
    else
      if document
        data = open( URI.parse( URI.encode( document.uploaded_file.url ) ) )
        send_data data, :filename => document.uploaded_file_file_name
      end
    end
  end

  def download
    folders = @asset.folders
    file_name  = "#{@asset.name}.zip"
    temp_file  = Tempfile.new("#{file_name}-#{current_user.id}")

    Zip::OutputStream.open(temp_file.path) do |zos|
      folders.walk_tree do |folder, level|
        # zos.mkdir folder.name
        folder.documents.each do |document|
          zos.put_next_entry(document.file_name)
        end
      end
    end

    send_file temp_file.path, :type => 'application/zip',
                              :disposition => 'attachment',
                              :filename => file_name
    temp_file.close
  end

end


