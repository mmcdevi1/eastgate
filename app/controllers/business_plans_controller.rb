class BusinessPlansController < HatchesController
  before_action :correct_client

  def index
    add_breadcrumb 'Business Plans', ''
  end
end
