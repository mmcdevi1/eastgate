class HatchesController < ApplicationController
  before_action :set_asset
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
end
