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
    @assets = (params[:controller] == 'assets') ? Asset.find(params[:id]) : Asset.find(params[:asset_id])
    if @asset.client_id != current_user.client_id
      if !current_user.admin?
        redirect_to assets_path
      else
      end
    end
  end
end
