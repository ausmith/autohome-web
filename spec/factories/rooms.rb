# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

valid = '0123456789abcdefABCDEF'

FactoryGirl.define do
  factory :room do
    name Faker::Name.first_name
  end
end

