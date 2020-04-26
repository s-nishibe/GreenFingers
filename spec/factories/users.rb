FactoryBot.define do
  factory :user do
  	name { '名前' }
  	email { Faker::Internet.email }
  	introduction { '自己紹介' }
  	password { 'password' }
  	password_confirmation { 'password' }
  end
end