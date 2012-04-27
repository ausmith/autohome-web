class ApplicationController < ActionController::Base
  include Clearance::Authentication
  include AuthorizeHelper
  protect_from_forgery

  before_filter :flash_authorize
end
