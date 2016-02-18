class ApplicationController < ActionController::Base
  include DeviseHelper

  protect_from_forgery with: :exception

  # User is redirected to users dashboard after sign in
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_path
    elsif current_user.broker?
      asset_folders_path(current_user.assets.first)
    else
      assets_path
    end
  end
end