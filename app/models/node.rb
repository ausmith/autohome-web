class Node < ActiveRecord::Base
  attr_accessible :mac_address, :status, :take_offline

  validates :mac_address, :format => {  :with => /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/, 
                                        :message => "DEVTEXT_MAC Address format must be \"XX:XX:XX:XX:XX:XX\"" },
                          :presence => true,
                          :uniqueness => true

end
