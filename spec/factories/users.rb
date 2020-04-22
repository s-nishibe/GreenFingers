FactoryBot.define do
  factory :users do
  	name
  	email
  	introduction
  	password
  	password_confirmation
  end

  factory :twitter_users do
  end
end