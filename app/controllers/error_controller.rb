class ErrorController < ApplicationController
  skip_before_filter :authenticate_user!

  layout 'logged_out'

  def error_403
    handle_error 403
  end

  def error_404
    handle_error 404
  end

  def error_500
    handle_error 500
  end

  private

  def handle_error(err)
    @exception = env["action_dispatch.exception"]
    respond_to do |format|
      format.html { render :status => err }
      format.all  { render :nothing => true, :status => err }
    end
  end
end
