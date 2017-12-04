class StaticPagesController < ApplicationController
	before_action :authenticate_user!
  layout :layout

  def index
  end

  def about
    @executive_teams = ExecutiveTeam.is_member
    @executive_team_header = ExecutiveTeam.where(is_member: false).first
    render layout: "about"
  end

  def career
  end

  private
  def layout
  	"static_pages"
  end
end
