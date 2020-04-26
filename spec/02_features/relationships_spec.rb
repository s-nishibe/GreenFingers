require 'rails_helper'

RSpec.feature 'フォロー・フォロワー機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:user2) { create(:user) }
    sign_in user
    visit user_path(user2)
  end

  feature '「フォローする」ボタンを押すと', js: true do
  	background do
  	  click_button 'フォローする'
  	end
  	scenario 'ボタンの表示が「フォロー中」になる' do
  	  expext(page).to have_button 'フォロー中'
    end

    scenario '相手のフォロワー数が増える' do
      expext(page).to have_link '1フォロワー'
    end

    scenario '自分のフォロー数が増える' do
      visit user_path(user)
      expext(page).to have_link '1フォロー'
    end
  end

  feature '「フォロー中」ボタンを押すと', js: true do
  	background do
  	  click_button 'フォローする'
  	  find '#follow_btn', text: 'フォロー中'
  	  click_button 'フォロー中'
  	end
  	scenario 'ボタンの表示が「フォローする」になる' do
  	  expext(page).to have_button 'フォローする'
    end

    scenario '相手のフォロワー数が減る' do
      expect(page).to have_link '0フォロワー'
    end

    scenario '自分のフォロー数が減る' do
      visit user_path(user)
      expext(page).to have_link '0フォロー'
    end
  end
end