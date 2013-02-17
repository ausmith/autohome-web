class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication :[only, :new, :create]
  before_filter :authenticate_user!

  def new
    super
  end

end
