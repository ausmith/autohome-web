class DataType < ActiveRecord::Base
  attr_accessible :longhand_unit, :shorthand_unit
  has_many :sensor_types

  validates :longhand_unit, :presence => true, :length => { :minimum => 1,
                                         :maximum => 32,
                                         :too_short => I18n.t('data_types.error_longhand_unit_too_short'),
                                         :too_long => I18n.t('data_types.error_longhand_unit_too_long') }
  validates :shorthand_unit, :presence => true, :length => { :minimum => 1,
                                         :maximum => 8,
                                         :too_short => I18n.t('data_types.error_shorthand_unit_too_short'),
                                         :too_long => I18n.t('data_types.error_shorthand_unit_too_long') }
end
