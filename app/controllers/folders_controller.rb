class FoldersController < HatchesController
  before_action :correct_client

  layout :layout

  def index
    @folders = @asset.folders.roots
  end

  def show
    @current_folder = Folder.find(params[:id])
    if @current_folder
      @folders = @current_folder.children
      @documents = @current_folder.documents
    end
  end

  private

  def layout
    'folders'
  end
end
