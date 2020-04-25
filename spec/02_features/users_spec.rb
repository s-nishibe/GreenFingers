require 'rails_helper'

RSpec.feature 'User機能のテスト' do
  given!(:user) { create(:user, id: 1, name: 'テスト花子', email: 'test@test', passwaord: 'testhanako', password_confirmation: 'testhanako') }
  given!(:user2) { create(:user, id: 2, name: 'テスト緑子') }

  feature '会員登録のテスト' do
  	scenario '名前・メールアドレス・パスワードで会員登録できる' do
  	  visit new_user_registration_path
  	  fill_in 'お名前', 'テスト太郎'
  	  fill_in 'メールアドレス', 'test3@test3'
  	  fill_in 'パスワード', 'testtarou'
  	  fill_in 'パスワード（確認）', 'testtarou'
  	  click_button '登録'
  	  expect(page).to have_content 'テスト太郎さんのタイムライン'
    end
  end

  feature 'ログインのテスト' do

  	scenario 'メールアドレス・パスワードでログインできる' do
  	  visit new_user_session_path
  	  fill_in 'お名前', 'テスト花子'
  	  fill_in 'メールアドレス', 'test@test'
  	  click_button 'ログイン'
  	  expect(page).to have_content 'テスト花子さんのタイムライン'
    end
  end

  feature 'User関連ページの表示・遷移' do
  	background do
  	  sign_in user
  	end

  	scenario '会員一覧ページの各アイコンからUser詳細ページへ' do
  	  visit users_path(who: 'all_users')
  	  click_on '.profile_img', href: user_path(user2)
  	  expect(page).to have_content 'テスト緑子さんが育てている花'
    end

    scenario '日記一覧ページの各アイコンからUser詳細ページへ' do
      visit blogs_path(page: 'all_blogs')
      click_on '.profile_img', href: user_path(user2)
  	  expect(page).to have_content 'テスト緑子さんが育てている花'
    end

    scenario '自分以外のUser編集画面はアクセスできない' do
      visit edit_blog_path(user2)
      expect(page).to have_content 'お探しのページにはアクセスできませんでした。'
    end
  end

  feature 'User情報の編集' do
  	background do
  	  sign_in user
  	  visit edit_user_path(user)
  	end

  	scenario '名前が1字以下だとエラーメッセージ表示' do
  	  fill_in 'お名前', ''
  	  click_button '更新する！'
  	  expect(page).to have_content 'お名前は1文字以上20文字以内にしてください。'
    end

    scenario '名前が20字以上だとエラーメッセージ表示' do
      fill_in 'お名前', Faker::Lorem.character(number: 21)
  	  click_button '更新する！'
  	  expect(page).to have_content 'お名前は1文字以上20文字以内にしてください。'
    end

    scenario '退会処理が正しくできる' do
      click_link '退会する'
      expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
      page.driver.browser.switch_to.alert.accept
      visit user_path, method: :delete
      expect(page).to have_content '退会処理は正常に行われました。ご利用ありがとうございました。'
    end
  end

end