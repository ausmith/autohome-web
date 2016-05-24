class Room < ActiveRecord::Base

  scope :available, conditions: { deleted_at: nil }

  attr_accessible :name

  has_and_belongs_to_many :nodes
  has_many :sec_events

  validates :name, :uniqueness => true,
                   :length => { :minimum => 2,
                                :too_short => I18n.t('rooms.error_name_too_short'),
                                :maximum => 128,
                                :too_long => I18n.t('rooms.error_name_too_long') },
                   :presence => true

  def soft_delete
    self.deleted_at = Time.now
    self.save!
  end
end
