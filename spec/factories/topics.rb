FactoryBot.define do
  factory :topics do
  	user_id { Faker::Number.between(from: 1, to: 100 ) }
  	title { Faker::Lorem.characters(number: 50) }
  	category { Faker::Number.between(from: 1, to: 100 ) }
  	status { Faker::Boolean.boolean(true_ratio: 0.2) }
  end
end
