class UsersController < Clearance::UsersController
  skip_before_filter :flash_authorize, :only => [:new, :create]
end
