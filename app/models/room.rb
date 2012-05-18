class Room < ActiveRecord::Base
  validates :title, :presence => true, :length => { :in => 3..64 }
end
