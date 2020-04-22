FactoryBot.define do
  factory :stamps do
  	user_id { Faker::Number.between(from: 1, to: 100 ) }
  	blog_id { Faker::Number.between(from: 1, to: 100 ) }
  	stamp_img { Faker::Number.between(from: 1, to: 5 ) }
  end
end

