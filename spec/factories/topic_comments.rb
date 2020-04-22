FactoryBot.define do
  factory :topic_comment do
  	user_id { Faker::Number.between(from: 1, to: 100 ) }
  	blog_id { Faker::Number.between(from: 1, to: 100) }
  	comment { Faker::Lorem.characters(number: 50) }
  end
end