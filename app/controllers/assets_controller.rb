class AssetsController < HatchesController
  before_action :set_asset, except: :index
  before_action :correct_client, only: :show
  layout :asset_layout

  def index
    if current_user.client_id == nil
      @assets = Asset.all
    else
      @assets = current_user.client.assets.all
    end
  end

  def show
  end

  def financials
  end

  private
  def asset_layout
    'asset' if params[:action] == 'index'
  end

end
