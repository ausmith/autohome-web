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
    value { a = 2 + rand(30); rand(36**a).to_s(36)}
    description { a = 2 + rand(62); rand(36**a).to_s(36)}
    enabled true

    factory :rfid_access_control do
      association :access_control_type, factory: :rfid_access_control_type
    end
  end
end

