class PasswordsController < Clearance::PasswordsController
  skip_before_filter :flash_authorize, :only => [:new, :create, :edit, :update]

end
