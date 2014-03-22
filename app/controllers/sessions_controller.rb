class SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  # Extends the existing `create` method for the purpose of logging security
  # events associated with creating sessions
  # @author Brian Turchyn
  def create
    super

    # Successful sign-in?
    if user_signed_in?
      event = SecEvent.new
      event.sec_event_type_cd = 'LOGINPASS'
      event.ip = request.remote_ip
      event.user_id = current_user.id

      event.save
    end
  end

  protected

  def auth_options
    { scope: resource_name,
      recall: "#{controller_path}#new",
      before_failure: log_auth_failure }
  end

  def log_auth_failure
    # Sign-in failure. See if the user existed or not
    user = User.where(email: params[:user][:email]).first
    event = SecEvent.new
    event.ip = request.remote_ip

    # If the user exists, mark as a failure
    if user != nil
      event.sec_event_type_cd = 'LOGINFAIL'
      event.user_id = user.id
    else
      # User does not exist
      event.sec_event_type_cd = 'LOGINDNE'
      event.description = params[:user][:email]
    end

    event.save
  end
end
