FactoryGirl.define do
  factory :sensor do
    name Faker::Base.regexify(/^[A-Za-z0-9\-_. ]{2,64}$/)
    node
    sensor_type
    starting_pin Random.rand(0..20)
    pin_type { [:Analog, :Digital].sample }
  end
end

