FactoryGirl.define do
  factory :data_type do
    longhand_unit { a = 1 + rand(31); rand(36**a).to_s(36)}
    shorthand_unit { a = 1 + rand(7); rand(36**a).to_s(36)}
  end
end

