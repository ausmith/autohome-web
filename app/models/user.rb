###############################################################################
# This file is part of The Autohome Project.
#
# The Autohome Project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Autohome Project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with The Autohome Project.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

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
  has_many :access_controls
  has_many :sec_events
  
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
  
  # Displays the first name and last name if both exist. Otherwise, displays
  # the email address of the user.
  # @author Brian Turchyn
  def display_full_name
    if self[:first_name] != nil && self[:first_name].length > 0 &&
        self[:last_name] != nil && self[:last_name].length > 0 then
      self[:first_name] + " " + self[:last_name]
    else
      self[:email]
    end
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
    self[:deleted_at] = Time.current
  end
end
