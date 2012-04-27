module AuthorizeHelper
  extend Clearance::Authentication

  def flash_authorize
    error_deny_access('Credentials required') unless signed_in?
  end

  def error_deny_access(flash_message = nil)
    store_location
    flash[:error] = flash_message if flash_message
    if signed_in?
      redirect_to(url_after_denied_access_when_signed_in)
    else
      redirect_to(url_after_denied_access_when_signed_out)
    end
  end

end
