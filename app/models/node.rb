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

class Node < ActiveRecord::Base
  STATUS = {
    :active => 1,
    :taken_offline => 2,
    :inactive => 3,
    :error => 4
  }

  attr_accessible :mac_address, :status, :take_offline, :room_ids, :room_id
  attr_accessor :old_one_time_key, :old_initialization_key
  has_and_belongs_to_many :rooms
  has_many :sensors
  has_many :data_points
  has_many :sec_events

  validates :mac_address, :format => {  :with => /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/, 
                                        :message => "DEVTEXT_MAC Address format must be \"XX:XX:XX:XX:XX:XX\"" },
                          :presence => true,
                          :uniqueness => true
  validates :status, :inclusion => { :in => STATUS.values }
  validate :initialize_keys
  validate :at_least_one_room

  def self.status
    status = Node::STATUS
  end

  def update_one_time_key
    self.old_one_time_key = self.one_time_key
    self.one_time_key = SecureRandom.hex(32)
  end

  def update_initialization_key
    self.old_initialization_key = self.initialization_key
    self.initialization_key = SecureRandom.hex(32)
  end

  protected

  def initialize_keys
    if self.new_record?
      self.initialization_key = SecureRandom.hex(32)
      self.one_time_key = SecureRandom.hex(32)
    end
  end

  # Validate that there is at least one room attached to a node
  def at_least_one_room
    errors.add(:base, I18n.t('nodes.error_room_invalid')) unless room_ids.length > 0
  end
end
