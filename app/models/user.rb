class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, and :omniauthable
  before_destroy :prevent_super_admin_destroy
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :first_name, :last_name
  # attr_accessible :title, :body

  def display_name
    self[first_name] || self[email]
    #if first_name == nil
    #  return :email
    #end
  end
  
  # Prevents original user ("super admin") from being removed from the user table
  def prevent_super_admin_destroy
    errors.add :base, "Cannot delete super admin." unless id != 1
  end

end
