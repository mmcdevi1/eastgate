require 'zipruby'
require 'uri'

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
        data = open( document.uploaded_file.url ).path
        send_file data, :filename => document.uploaded_file_file_name
      end
    end
  end

  def download
    folders = @asset.folders
    file_name  = "#{@asset.name}.zip"
    temp_file  = Tempfile.new("#{@asset.name}-#{current_user.id}")

    Zip::Archive.open(temp_file.path, Zip::CREATE) do |ar|
      folders.walk_tree do |folder, level|
        result = ''

        unless folder.is_root?
          level.times do |i|
            result += "#{folder.ancestors.reverse[i].name}/"
          end
        end

        ar.add_dir( "#{result}#{folder.name}" )

        folder.documents.each do |document|
          data = Rails.env.development? ? document.uploaded_file.path : open(document.uploaded_file.url).path
          ar.add_file("#{result}#{folder.name}/#{document.file_name}", data)
        end
      end
    end

    send_file temp_file.path, :type => 'application/zip',
                              :disposition => 'attachment',
                              :filename => file_name
    temp_file.close
  end

end


























