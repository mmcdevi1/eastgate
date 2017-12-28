class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  layout :admin_layout

  def index

  end

  private

  def admin_layout
    if params[:controller] == 'admin/executive_teams'
      'website_editor'
    elsif params[:controller] == 'admin/general_contents'
      'website_editor'
    elsif params[:controller] == 'admin/career_applications'
      'careers_applications'
    elsif params[:controller] == 'admin/job_categories'
      'careers_applications'
    elsif params[:controller] == 'admin/employment_types'
      'careers_applications'
    elsif params[:controller] == 'admin/minimum_experiences'
      'careers_applications'
    elsif params[:controller] == 'admin/job_postings'
      'careers_applications'
    else
      'admin'
    end
  end

  def authenticate_admin
    unless current_user.admin?
      flash[:danger] = 'You do not have access to this area!'
      redirect_to assets_path
    end
  end
end