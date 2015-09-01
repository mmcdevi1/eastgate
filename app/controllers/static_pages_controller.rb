class StaticPagesController < ApplicationController
	layout :layout

  def index
  end

  private
  def layout
  	"static_pages"
  end
end
