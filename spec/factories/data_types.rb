require 'faker'

valid = '0123456789abcdefABCDEF'

FactoryGirl.define do
  factory :data_type do
    longhand_unit Faker::Base.regexify(/[A-Za-z0-9]{1,32}/)
    shorthand_unit Faker::Base.regexify(/[A-Za-z0-9]{1,8}/)
  end
end

