FactoryBot.define do
  factory :tweet do
    tweet { Faker::Lorem.characters(number: 60) }
    user
  end
end
