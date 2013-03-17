class Room < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :nodes

  validates :name, :uniqueness => true,
                   :length => { :minimum => 2,
                                :too_short => I18n.t('rooms.error_name_too_short'),
                                :maximum => 128,
                                :too_long => I18n.t('rooms.error_name_too_long') },
                   :presence => true
end
