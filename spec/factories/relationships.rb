FactoryBot.define do
  factory :relationships do
  	user_id { Faker::Number.between(from: 1, to: 100 ) }
  	follow_id { Faker::Number.between(from: 1, to: 100 ) }
  end
end