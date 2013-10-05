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
    else
      # Sign-in failure. See if the user existed or not
      user = User.find_by_email_address(params[:user][:email])
      event = SecEvent.new
      event.ip = request.remote_ip

      # If the user exists, mark as a failure
      if user != nil
        event.sec_event_type_cd = 'LOGINFAIL'
        event.user_id = current_user.id
      else
        # User does not exist
        event.sec_event_type_cd = 'LOGINDNE'
        event.description = params[:user][:email]
      end

      event.save
    end
  end
end
