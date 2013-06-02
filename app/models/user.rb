class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, and :omniauthable
  before_destroy :prevent_super_admin_destroy
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable

  # Setup accessible (or not protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  # attr_accessor :accessible
  # attr_accessible :title, :body
  
  validates :first_name, :presence => { :message => I18n.t('user.error_first_name_blank')},
                         :length => { :minimum => 2,
                                      :maximum => 32,
                                      :too_short => I18n.t('user.error_first_name_too_short'),
                                      :too_long => I18n.t('user.error_first_name_too_long') }

  validates :last_name, :presence => { :message => I18n.t('user.error_last_name_blank')},
                         :length => { :minimum => 2,
                                      :maximum => 32,
                                      :too_short => I18n.t('user.error_last_name_too_short'),
                                      :too_long => I18n.t('user.error_last_name_too_long') }

  def display_name
    self[:first_name] || self[:email]
  end
  
  # Prevents original user ("super admin") from being removed from the user table
  def prevent_super_admin_destroy
    if id == 1
      errors.add :base, "Cannot delete super admin."
      return false
    end
  end
  
  # private
  #   def mass_assignment_authorizer(role = :default)
  #     super + (accessible || [])
  #   end

  def soft_delete
    update_attributes(:deleted_at, Time.current)
  end
end
