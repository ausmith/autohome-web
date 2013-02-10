class Node < ActiveRecord::Base
  STATUS = {
    :active => 1,
    :taken_offline => 2,
    :inactive => 3,
    :error => 4
  }

  attr_accessible :mac_address, :status, :take_offline, :room_ids
  has_and_belongs_to_many :rooms

  validates :mac_address, :format => {  :with => /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/, 
                                        :message => "DEVTEXT_MAC Address format must be \"XX:XX:XX:XX:XX:XX\"" },
                          :presence => true,
                          :uniqueness => true
  validates :status, :inclusion => { :in => STATUS.values }


  def self.status
    status = Node::STATUS
  end
end
