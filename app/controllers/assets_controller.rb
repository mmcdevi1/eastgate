class AssetsController < HatchesController
  before_action :set_asset, except: :index
  before_action :correct_client, only: :show
  before_action :set_client

  layout :asset_layout

  def index
    if current_user.client_id == nil
      @assets = Asset.all
    else
      @assets = current_user.client.assets.all
    end
  end

  def show
    add_breadcrumb 'Property Snapshot', ''
  end

  def financials
    add_breadcrumb 'Financials', ''
  end

  private

  def asset_layout
    'asset' if params[:action] == 'index'
  end

end
