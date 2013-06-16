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

class AccessControl < ActiveRecord::Base
  attr_accessible :access_control_type_id, :description, :enabled, :value
  belongs_to :access_control_type
  belongs_to :user

  validates :access_control_type_id, :presence => true
  validates :description, :presence => true, :length => { :in => 2..64 }
  validates :value, :presence => true, :length => { :in => 1..100 }
  validates :user, :presence => true

end
