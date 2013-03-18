class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [:new, :create, :cancel]
  prepend_before_filter :authenticate_scope!
  before_filter :deny_access, :unless => :authorized_user?, :only => [:edit, :update]
  
  def new
    super
  end

  def edit
    @user = User.find_by_id(params[:id])
    
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @users }
    end
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
  
  def authorized_user?
    user = User.find_by_id(params[:id])
    current_user != nil && ( current_user.admin || current_user.id == user.id )
  end
  
  def deny_access
      redirect_to users_path
  end

end
