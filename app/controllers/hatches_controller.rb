class HatchesController < LayoutsController
  layout :layout

  def index
  end

  private

  def layout
    'hatch'
  end
end
