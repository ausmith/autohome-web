FactoryGirl.define do

  factory :room do
    title "Foo#{Random.rand(100000)}"
    description "Description"
  end

end

