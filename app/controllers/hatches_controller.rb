class HatchesController < ApplicationController
  before_action :set_asset
  before_action :authenticate_user!

  layout :layout

  def index
  end

  private

  def set_asset
    if params[:action] == 'show'
      @asset = Asset.find(params[:id])
    else
      @asset = Asset.find(params[:asset_id])
    end
  end

  def layout
    'hatch'
  end

  def correct_client
    if params[:controller] == 'assets'
      @asset = Asset.find(params[:id])
    else
      @asset = Asset.find(params[:asset_id])
    end
    redirect_to assets_path if @asset.client_id != current_user.client_id
  end
end
