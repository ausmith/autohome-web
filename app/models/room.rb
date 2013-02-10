class Room < ActiveRecord::Base
  attr_accessible :name

  validates :name, :uniqueness => true,
                   :length => { :minimum => 2,
                                :too_short => "DEVTEXT_%{count} characters is the minimum allowed.",
                                :maximum => 128,
                                :too_long => "DEVTEXT_%{count} characters is the maximum allowed." },
                   :presence => true
end
