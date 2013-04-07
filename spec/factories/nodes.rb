# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

valid = '0123456789abcdefABCDEF'

FactoryGirl.define do
  sequence :mac_address do |n|
    a = (1..6).map{"%0.2X" % rand(256)}.join(":")
    puts a
    a
  end

  factory :node do
    mac_address { (1..6).map{"%0.2X" % rand(256)}.join(":") }
    ip_address Faker::Internet.ip_v4_address
    status Node.status().values[Random.rand(Node.status().size)]
    take_offline false
    last_online Time.now.getutc
    room_id Random.rand(100)
  end
end

