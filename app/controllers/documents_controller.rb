require 'zipruby'

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
    temp_file  = Tempfile.new("#{@asset.name}-#{current_user.id}")

    Zip::Archive.open(temp_file.path, Zip::CREATE) do |ar|

      folders.walk_tree do |folder, level|
        if folder.is_root?
          ar.add_dir( "#{folder.name}" )
          folder.documents.each do |document|
            data = Rails.env.development? ? document.uploaded_file.path : 'http://s3.amazonaws.com/eastgate-file-hosting/documents/uploaded_files/000/000/002/original/2015-11-16_The_New_Yorker_Presentation_Book.pdf?1455803653'
            ar.add_file("#{folder.name}/#{document.file_name}", data)
          end
        else
          result = ''
          level.times do |i|
            result += "#{folder.ancestors.reverse[i].name}/"
          end
          ar.add_dir( "#{result}#{folder.name}" )

          folder.documents.each do |document|
            data = Rails.env.development? ? document.uploaded_file.path : 'http://s3.amazonaws.com/eastgate-file-hosting/documents/uploaded_files/000/000/002/original/2015-11-16_The_New_Yorker_Presentation_Book.pdf?1455803653'
            ar.add_file("#{result}#{folder.name}/#{document.file_name}", data)
          end
        end
      end
    end

    if Rails.env.development?
      send_file temp_file.path, :type => 'application/zip',
                                :disposition => 'attachment',
                                :filename => file_name
    else
      data = open( URI.parse( URI.encode( temp_file.path ) ) )
      send_data temp_file.path, :type => 'application/zip',
                      :disposition => 'attachment',
                      :filename => file_name
    end

    temp_file.close
  end

end


























