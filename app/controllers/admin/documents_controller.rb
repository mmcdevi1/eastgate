module Admin
  class DocumentsController < AdminsController
    before_action :set_document, only: [:show, :edit, :update, :destroy]
    before_action :set_asset, only: [:new, :create, :edit, :update]
    before_action :set_folder, only: [:new, :create, :edit, :update]

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
        redirect_to admin_asset_folder_path(@asset, @folder)
        flash[:success] = 'File uploaded.'
      else
        render 'new'
      end
    end

    def update
      if @document.update(document_params)
        @document.update_attribute(params[:uploaded_file_file_name], 'asdf')
        redirect_to admin_asset_folders_path
        flash[:success] = 'Rename Successful.'
      else
        render 'edit'
      end
    end

    def destroy
      @document.destroy
      flash[:success] = 'File deleted.'
      redirect_to :back
    end

    def get
      document = Document.find_by_id(params[:id])
      if document
        data = open( URI.parse( URI.encode( document.uploaded_file.url ) ) )
        send_data( data, :filename => document.uploaded_file_file_name )
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
      params.require(:document).permit(:folder_id, :uploaded_file, :uploaded_file_file_name)
    end
  end
end