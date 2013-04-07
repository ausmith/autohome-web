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
      format.json { render json: @user }
    end
  end
  
  def update
    @user = User.find_by_id(params[:id])
    if params[:user][:password].blank?
       params[:user].delete("password")
       params[:user].delete("password_confirmation")
    end
    self.resource = resource_class.to_adapter.get!(@user.to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    
    if @user == current_user
      if resource.update_with_password(resource_params)   # updates profile but requires password confirmation
        if is_navigational_format?
          flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
            :update_needs_confirmation : :updated
          set_flash_message :notice, flash_key
        end
        sign_in resource_name, resource, :bypass => true  # re-signs in user with new profile properties
        respond_with resource, :location => after_update_path_for(resource)
      else
        clean_up_passwords resource
        respond_with resource
      end
    else
      if resource.update_attributes(resource_params)    # updates profile
        if is_navigational_format?
          flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
            :update_needs_confirmation : :updated
          set_flash_message :notice, flash_key
        end
        respond_with resource, :location => after_update_path_for(resource)
      else
        clean_up_passwords resource
        respond_with resource
      end
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
  
  def after_update_path_for(resource)
    dashboard_path
  end
  
  def authorized_user?
    user = User.find_by_id(params[:id])
    current_user != nil && ( current_user.admin || current_user.id == user.id )
  end
  
  def deny_access
      redirect_to users_path
  end

end
