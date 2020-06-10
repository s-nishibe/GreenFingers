require 'rails_helper'

RSpec.feature 'のテスト' do
  let!(:user) { create(:user) }
  let!(:plant) { create(:plant, user_id: user.id) }
  let!(:blog) { create(:blog, user_id: user.id, plant_id: plant.id) }
  feature 'てすと' do
  	scenario 'ラジオボタン' do
  		sign_in user
  		visit new_blog_path
  		choose 'あげた'
  	end
  end
end