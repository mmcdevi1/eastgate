class HatchesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_asset, except: :index
  before_action :set_asset, except: :index

  add_breadcrumb "Hatch", :root_path
  add_breadcrumb 'Assets', :assets_path
  add_breadcrumb :breadcrumb, :breadcrumb_path

  layout :hatch_layout

  def index
    redirect_to assets_path
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
    @asset = (params[:controller] == 'assets') ? Asset.find(params[:id]) : Asset.find(params[:asset_id])
    if @asset.client_id != current_user.client_id
      if !current_user.admin?
        redirect_to assets_path
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
