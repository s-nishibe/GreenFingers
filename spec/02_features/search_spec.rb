require 'rails_helper'

RSpec.feature '検索機能のテスト' do
  background do
    given!(:user) { create(:user) }
    sign_in user
    visit user_path(user)
  end

  feature 'Userの検索' do
  	background do
  	  fill_in '#search_word', with: 'てすと'
  	  select '会員', from: '#search_model'
  	  click_button '検索'
  	end

  	scenario '検索結果画面が表示される' do
  	  expect(page).to have_content '「てすと」での会員検索結果です！'
    end
  end

  feature 'Blogの検索' do
  	background do
  	  fill_in '#search_word', with: 'てすと'
  	  select '日記', from: '#search_model'
  	  click_button '検索'
  	end

  	scenario '検索結果画面が表示される' do
  	  expect(page).to have_content '「てすと」での日記検索結果です！'
    end
  end

  feature 'Topicの検索' do
  	background do
  	  fill_in '#search_word', with: 'てすと'
  	  select 'トピ', from: '#search_model'
  	  click_button '検索'
  	end

  	scenario '検索結果画面が表示される' do
  	  expect(page).to have_content '「てすと」でのトピック検索結果です！'
    end
  end

end