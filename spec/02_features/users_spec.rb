require 'rails_helper'

RSpec.feature 'Userのテスト' do
  feature 'ログインのテスト' do
  	let!(:user) { create(:user) }

  	scenario '新規登録ができる' do
  	  visit new_user_registration_path
  	  fill_in 'お名前', with: 'GreenFingers公式'
  	  fill_in 'メールアドレス', with: 'greenfingers@gmail.com'
  	  fill_in 'パスワード', with: 'password'
  	  fill_in 'パスワード（確認）', with: 'password'
  	  click_on '登録'
  	  expect(page).to have_content 'アカウント登録が完了しました。'
  	end

  	scenario 'ログアウトできる' do
  	  sign_in user
  	  visit homes_top_path
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
  	end

  	scenario 'ログインできる' do
  	  build(:user, email: 'greenfingers2@gmail.com', password: 'password2')
  	  visit new_user_session_path
  	  fill_in 'メールアドレス', with: 'greenfingers2@gmail.com'
  	  fill_in 'パスワード', with: 'password2'
  	  click_on 'ログイン'
  	  expect(page).to have_content 'ログインしました。'
  	end

  	scenario '退会が正常に行われる' do

  	end
  end
end