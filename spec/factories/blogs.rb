FactoryBot.define do
  factory :blogs do
    user_id { Faker::Number.between(from: 1, to: 100 ) }
    title { Faker::Lorem.characters(number: 50) }
    content { Faker::Lorem.characters(number: 100) }
    plant_name { Faker::Lorem.characters(number: 10) }
    plant_kind { Faker::Number.between(from: 0, to: 3 ) }
    weather { Faker::Number.between(from: 0, to: 3 ) }
    temperature { Faker::Number.decimal(l_digit: 2, r_digit: 1) }
    water { Faker::Boolean.boolean(true_ratio: 0.2) }
    status { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end

