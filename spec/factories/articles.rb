FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence(3, false, 4) }
    body { Faker::Lorem.paragraph(10, true) }
  end
end
