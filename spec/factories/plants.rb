FactoryBot.define do
  factory :plants do
    user_id { Faker::Number.between(from: 1, to: 100 ) }
    name { Faker::Lorem.characters(number: 10) }
    kind { Faker::Number.between(from: 0, to: 3 ) }
    memo { Faker::Lorem.characters(number: 100) }
  end
end
