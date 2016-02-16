module Admin
  class DocumentsController < AdminsController
    before_action :set_asset, only: [:new, :create]
    before_action :set_folder, only: [:new, :create]

    def index
    end

    def show
    end

    def edit
    end

    def new
      @document = @folder.documents.new
    end

    def create
      @document = @folder.documents.new(document_params)
      if @document.save
        redirect_to admin_asset_folders_path
        flash[:success] = 'File uploaded.'
      else
        render 'new'
      end
    end

    def update
    end

    def destroy
    end

    def get
      document = Document.find_by_id(params[:id])
      if document
        data = open( URI.parse( URI.encode( document.uploaded_file.url ) ) )
        send_data data, :filename => document.uploaded_file_file_name
      end
    end

    private

    def set_folder
      @folder = Folder.find(params[:folder_id])
    end

    def set_asset
      @asset = Asset.find(params[:asset_id])
    end

    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:folder_id, :uploaded_file)
    end
  end
end