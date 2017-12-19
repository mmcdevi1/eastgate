class ApplicationController < ActionController::Base
  lock :actions => ['static_pages#about']
  include DeviseHelper

  protect_from_forgery with: :exception

  # User is redirected to users dashboard after sign in
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_path
    elsif current_user.broker?
      asset_folders_path(current_user.assets.first)
    else
      root_path
    end
  end

  def logged_in?
    session[:login]
  end

  private
  def authenticate
    login = authenticate_or_request_with_http_basic do |username, password|
      username == 'username' && password == 'password'
    end
    session[:login] = login
  end

  def do_logout
    session[:login] = nil
  end
end