class HatchesController < ApplicationController
  before_action :set_asset
  before_action :authenticate_user!

  add_breadcrumb "Hatch", :root_path
  add_breadcrumb 'Assets', :assets_path
  add_breadcrumb :breadcrumb, :breadcrumb_path

  layout :hatch_layout

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

  def hatch_layout
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
