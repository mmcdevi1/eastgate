class LayoutsController < ApplicationController
  layout :hatch_layout

  private
  def hatch_layout
    'hatch'
  end
end