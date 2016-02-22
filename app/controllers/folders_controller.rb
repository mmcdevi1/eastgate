class FoldersController < HatchesController
  before_action :correct_client

  layout :layout

  def index
    @folders = @asset.folders.roots
  end

  def show
    begin
      @current_folder = Folder.find(params[:id])
      if @current_folder
        @folders = @current_folder.children
        @documents = @current_folder.documents
      end
    rescue
      redirect_to asset_folders_path(@asset)
      flash[:danger] = 'That page does not exist'
    end
  end

  private

  def layout
    'folders'
  end
end
