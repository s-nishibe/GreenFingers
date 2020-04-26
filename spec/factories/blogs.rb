FactoryBot.define do
  factory :blog do
    user_id { Faker::Number.between(from: 1, to: 100 ) }
    title { Faker::Lorem.characters(number: 50) }
    content { Faker::Lorem.characters(number: 100) }
    plant_id { Faker::Number.between(from: 1, to: 100) }
    weather { Faker::Number.between(from: 0, to: 3 ) }
    temperature { Faker::Number.between(from: 0, to: 30) }
    water { Faker::Boolean.boolean(true_ratio: 0.2) }
    status { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end

