class AssetsController < HatchesController
  before_action :set_asset, except: :index
  layout :asset_layout

  def index
    @assets = Asset.all
  end

  def show
  end

  def financials
  end

  private
  def asset_layout
    'asset' if params[:action] == 'index'
  end

  # def correct_client
  #   @asset = Asset.find(params[:id])
  #   redirect_to root_path if @asset
  # end
end
