class SensorType < ActiveRecord::Base
  attr_accessible :data_type, :data_type_id, :description, :library_file, :name, :pins_used
  belongs_to :data_type

  validates :name, :presence, :length => { :minimum => 2,
                                            :maximum => 32,
                                            :too_short => I18n.t('sensor_types.name_too_short'),
                                            :too_long => I18n.t('sensor_types.name_too_long') }

  validates :library_file, :length => { :maximum => 64,
                                        :too_long => I18n.t('sensor_types.library_file_too_long') },
            :format => { :with => /^[A-Za-z0-9]{1,61}\.rb$/, :message => I18n.t('sensor_types.library_file_bad_format') }

  validates :pins_used, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }

  validates :data_type, :presence => true
end
