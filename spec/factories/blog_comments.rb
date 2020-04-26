FactoryBot.define do
  factory :blog_comment do
    user_id { Faker::Number.between(from: 1, to: 100) }
    blog_id { Faker::Number.between(from: 1, to: 100) }
    comment { Faker::Lorem.characters(number: 100) }
  end
end
