class UsersController < Clearance::UsersController
  before_filter :authorize, :only => :new
end