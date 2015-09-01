class ApplicationController < ActionController::Base
  include DeviseHelper

  protect_from_forgery with: :exception

  # User is redirected to users dashboard after sign in
  def after_sign_in_path_for(resource)
    if current_user
      assets_path
    else
      root_path
    end
  end
end