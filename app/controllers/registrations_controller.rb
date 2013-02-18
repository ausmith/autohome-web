class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [:new, :create, :cancel]
  before_filter :authenticate_user!
  
  def new
    super
  end
  
  protected
  
  def after_sign_up_path_for(resource)
    #devise/registrations#new
    '/users/sign_up'
  end
  
  def after_inactive_sign_up_path_for(resource)
    #devise/registrations#new
    '/users/sign_up'
  end

end
