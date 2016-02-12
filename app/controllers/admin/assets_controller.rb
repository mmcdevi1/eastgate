module Admin
  class AssetsController < AdminsController
    before_action :set_asset, only: [:show, :edit, :update, :destroy]

    def index
      @clients = Client.all
      @assets = Asset.all
    end

    def show
    end

    def edit
    end

    def new
      @asset = Asset.new
    end

    def update
      if @asset.update(asset_params)
        redirect_to edit_admin_asset_path(@asset)
        flash[:success] = 'Asset Updated.'
      else
        render 'edit'
      end
    end

    def create
      @asset = Asset.new(asset_params)
      if @asset.save
        redirect_to edit_admin_asset_path(@asset)
        flash[:success] = 'New Asset Created.'
      else
        render 'new'
      end
    end

    def destroy
      @asset.destroy
      redirect_to admin_assets_path
      flash[:success] = 'Asset Deleted.'
    end

    private

    def set_asset
      @asset = Asset.find(params[:id])
    end

    def asset_params
      params.require(:asset).permit(
        :name,
        :summary,
        :address,
        :city,
        :state,
        :zipcode,
        :year_built,
        :size,
        :property_class,
        :property_type,
        :client_id,
        :asset_image,
        :percent_leased
        )
    end

  end
end