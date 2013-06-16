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
  factory :user do
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name

    factory :regular_user do
      admin false
    end

    factory :admin_user do
      admin true
    end
  end
end

