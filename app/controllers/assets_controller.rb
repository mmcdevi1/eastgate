class AssetsController < HatchesController
  before_action :set_asset, except: :index
  layout :asset_layout

  def index
    @assets = Asset.all
  end

  def show
  end

  private
  def asset_layout
    'asset' if params[:action] == 'index'
  end
end
