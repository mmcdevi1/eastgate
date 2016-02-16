class HatchesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_asset, except: :index

  layout :hatch_layout

  def index
    redirect_to assets_path
  end

  private

  def set_asset
    if params[:action] == 'show' && params[:controller] == 'assets'
      @asset = Asset.find(params[:id])
    else
      @asset = Asset.find(params[:asset_id])
    end
  end

  def hatch_layout
    'hatch'
  end

  def correct_client
    @asset = (params[:controller] == 'assets') ? Asset.find(params[:id]) : Asset.find(params[:asset_id])
    if @asset.client_id != current_user.client_id
      if !current_user.admin?
        redirect_to assets_path
        flash[:danger] = "You don't have permission to access this information!"
      else
      end
    end
  end

  def set_client
    @client = current_user.client
  end

  protected

  def breadcrumb
    @asset.name.capitalize
  end

  def breadcrumb_path
    (params[:action] == 'show') ? '' : asset_path(@asset)
  end

  helper_method :breadcrumb
  helper_method :breadcrumb_path
end
