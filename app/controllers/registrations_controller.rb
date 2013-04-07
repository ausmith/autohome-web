class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [:new, :create, :cancel]
  prepend_before_filter :authenticate_scope!
  before_filter :deny_access, :unless => :authorized_user?, :only => [:edit, :update]
  before_filter :administrator_only_access, :only => [:new, :create]
  
  def new
    super
  end

  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice,
            :"signed_up_but_#{resource.inactive_message}",
            :first_name => resource.first_name,
            :last_name => resource.last_name,
            :email => resource.email if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
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
    users_path
  end
  
  def after_inactive_sign_up_path_for(resource)
    #devise/registrations#new
    users_path
  end
  
  def authorized_user?
    user = User.find_by_id(params[:id])
    current_user != nil && ( current_user.admin || current_user.id == user.id )
  end
  
  def deny_access
      redirect_to users_path
  end

end
