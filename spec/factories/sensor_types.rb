FactoryGirl.define do
  factory :sensor_type do
    name Faker::Base.regexify(/^[A-Za-z0-9\-_. ]{2,32}$/)
    description Faker::Lorem.paragraph()
    data_type
    pins_used Random.rand(0..20)
    library_file Faker::Base.regexify(/^[A-Za-z0-9]{1,61}.rb$/)
  end
end

