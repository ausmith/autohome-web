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

FactoryGirl.define do
  factory :access_control do
    association :access_control_type, factory: :access_control_type
    user
    value Faker::Base.regexify(/^[A-Za-z0-9\-_. ]{2,32}$/)
    description Faker::Base.regexify(/^[A-Za-z0-9\-_. ]{2,64}$/)
    enabled true
  end
end

