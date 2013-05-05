class Node < ActiveRecord::Base
  STATUS = {
    :active => 1,
    :taken_offline => 2,
    :inactive => 3,
    :error => 4
  }

  attr_accessible :mac_address, :status, :take_offline, :room_ids
  attr_accessor :old_one_time_key, :old_initialization_key
  has_and_belongs_to_many :rooms
  has_many :sensors
  has_many :data_points

  validates :mac_address, :format => {  :with => /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/, 
                                        :message => "DEVTEXT_MAC Address format must be \"XX:XX:XX:XX:XX:XX\"" },
                          :presence => true,
                          :uniqueness => true
  validates :status, :inclusion => { :in => STATUS.values }
  validate :initialize_keys

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
end
