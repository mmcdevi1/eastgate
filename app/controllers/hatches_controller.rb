class HatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_broker

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
    if @asset.client_id != current_user.client_id && @asset.no_brokers?(current_user)
      if current_user.not_admin?
        redirect_to assets_path
        flash[:danger] = "You don't have permission to access this information!"
      end
    end
  end

  def redirect_broker
    if current_user.broker?
      unless params[:controller] == "folders" || params[:controller] == 'documents'
        redirect_to asset_folders_path(current_user.assets.first)
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
