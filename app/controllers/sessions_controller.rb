class SessionsController < Clearance::SessionsController
  def url_after_create
    dashboard_path
  end
end
