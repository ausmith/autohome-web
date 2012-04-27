class SessionsController < Clearance::SessionsController
  skip_before_filter :flash_authorize

  def new
    if signed_in?
      redirect_to dashboard_path
    else
      super
    end
  end

  def destroy
    sign_out
    redirect_to url_after_destroy, :notice => 'Logged out.'
  end

  def url_after_create
    dashboard_path
  end
end
