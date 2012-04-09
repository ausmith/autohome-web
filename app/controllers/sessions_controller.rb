class SessionsController < Clearance::SessionsController
  layout "sign_in", :only => 'new'
  
  def new
  end
  
  def sign_in_url
    '/'
  end
end