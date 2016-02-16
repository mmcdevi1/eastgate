module Admin
  class FoldersController < AdminsController
    before_action :set_folders, only: [:show, :edit, :update, :destroy]
    before_action :set_asset

    def index
      @folders = @asset.folders.roots
    end

    def show
      @tree_view = Folder.tree_view(:name)
      @current_folder = Folder.find(params[:id])
      if @current_folder
        @folders = @current_folder.children
        @documents = @current_folder.documents
      end
    end

    def edit
    end

    def new
      @folder = @asset.folders.new
      if params[:folder_id]
        @current_folder = Folder.find(params[:folder_id])
        @folder.parent_id = @current_folder.id
      end
    end

    def create
      @folder = @asset.folders.new(folder_params)
      if @folder.save
        redirect_to admin_asset_folder_path(@asset, @folder.ancestors.first)
        flash[:success] = "Folder created."
      else
        render :new
      end
    end

    def update
      if @folder.update(folder_params)
        redirect_to admin_asset_folders_path
        flash[:success] = 'Folder updated.'
      else
        render 'edit'
      end
    end

    def destroy
      @folder.destroy
      flash[:success] = 'Folder deleted.'
      redirect_to :back
    end

    private

    def set_asset
      @asset = Asset.find(params[:asset_id])
    end

    def set_folders
      @folder = Folder.find(params[:id])
    end

    def folder_params
      params.require(:folder).permit(:asset_id, :name, :parent_id)
    end
  end
end