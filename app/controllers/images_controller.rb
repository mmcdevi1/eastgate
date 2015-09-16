class ImagesController < HatchesController
  before_action :correct_client

  def index
    add_breadcrumb 'Images', ''
  end
end
