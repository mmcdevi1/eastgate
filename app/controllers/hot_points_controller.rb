class HotPointsController < HatchesController
  before_action :correct_client

  def index
    add_breadcrumb 'Hot Points', ''
  end
end
