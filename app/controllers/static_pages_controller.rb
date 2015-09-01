class StaticPagesController < ApplicationController
	layout :layout

  def index
    redirect_to assets_path
  end

  private
  def layout
  	"static_pages"
  end
end
