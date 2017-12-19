class StaticPagesController < ApplicationController

	layout :layout

  def index
  end

  def about
    @executive_teams = ExecutiveTeam.is_member
    @executive_team_header = ExecutiveTeam.where(is_member: false).first
    render layout: "about"
  end

  def career
    redirect_to login_path
  end

  private
  def layout
  	"static_pages"
  end

  def redirect_to_login_path
    unless current_user
      redirect_to login_path
    end
  end
end
