class StaticPagesController < ApplicationController
	layout :layout

  def index
  end

  def about
    render layout: "about"
  end

  def career
  end

  private
  def layout
  	"static_pages"
  end
end
