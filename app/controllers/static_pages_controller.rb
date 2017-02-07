class StaticPagesController < ApplicationController
	layout :layout

  def index
  end

  def about
    render layout: "about"
    @pdf_filename = File.join(Rails.root, "tmp/Project Copper.pdf")
    # send_file(@pdf_filename, :filename => "your_document.pdf", :disposition => 'inline', :type => "application/pdf")
  end

  def career
  end

  private
  def layout
  	"static_pages"
  end
end
