require 'rails_helper'

RSpec.feature 'Userのテスト' do
  let!(:user) { create(:user) }

  feature 'ログイン機能のテスト' do

  	xscenario '新規登録ができる' do
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
  		sign_in user
  		visit edit_user_path(user)
  		click_on '退会する'
  		expect(page).to have_content '退会処理は正常に行われました。ご利用ありがとうございました。'
  	end
  end

  feature 'ユーザ情報の編集' do
    background do
      sign_in user
      visit edit_user_path(user)
    end

    scenario '名前を変更' do
      fill_in 'お名前', with: 'GREENFINGERS'
      click_on '更新する！'
      expect(page).to have_content '会員情報が更新されました！'
    end

    scenario 'ひとことを変更' do
      fill_in 'ひとこと', with: 'こんにちは'
      click_on '更新する！'
      expect(page).to have_content '会員情報が更新されました！'
    end

    scenario '名前が空欄だと更新できない' do
      fill_in 'お名前', with: ''
      click_on '更新する！'
      expect(page).to have_content 'お名前は1文字以上20文字以内にしてください。'
    end
  end
end