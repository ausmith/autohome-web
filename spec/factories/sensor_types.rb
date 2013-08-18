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

valid = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_. '

FactoryGirl.define do
  factory :sensor_type do
    name {
      a = 2 + Random.rand(30)
      (0...a).map{
        valid[ Random.rand(62) ]
      }.join
    }
    description Faker::Lorem.paragraph()
    data_type
    pins_used Random.rand(0..20)
    library_file { 
      a = 1 + Random.rand(57)
      (0...a).map{
        valid[ Random.rand(62) ]
      }.join + '.rb'
    }
  end
end

