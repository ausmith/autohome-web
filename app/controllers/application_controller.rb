class ApplicationController < ActionController::Base
  class ForbiddenException < StandardError; end
  protect_from_forgery

  before_filter :set_locale
  before_filter :authenticate_user!
  layout :get_layout

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def get_layout
    if !user_signed_in?
      get_layout = "logged_out"
    else
      get_layout = "application"
    end
  end

  def after_sign_out_path_for(resource)
     new_user_session_path
  end

  def administrator_only_access
    unless user_signed_in? && current_user.admin?
      raise ApplicationController::ForbiddenException
    end
  end
end
