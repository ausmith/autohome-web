# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

valid = '0123456789abcdefABCDEF'

FactoryGirl.define do
  factory :node do
    mac_address Faker::Base.regexify(/[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/)
    ip_address Faker::Internet.ip_v4_address
    status 1
    take_offline false
    last_online Time.now.getutc
    room_id Random.rand(100)
  end
end

