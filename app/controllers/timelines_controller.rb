class TimelinesController < HatchesController
  before_action :correct_client

  def index
    @timeline = @asset.timelines.last
    add_breadcrumb 'Timeline', ''
  end
end
