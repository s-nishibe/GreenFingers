require 'rails_helper'

RSpec.feature 'Headerのテスト' do
  feature '非ログイン時の画面遷移' do
  	background do
  	  visit homes_top_path
  	end

  	scenario 'GreenFingersロゴからトップページへ' do
  	  click_on 'GreenFingers'
  	  expect(page).to have_content '新着記事'
  	end

  	scenario '「GreenFingersとは？」からアバウトページへ' do
  	  click_on 'Greenfingersとは？'
  	  expect(page).to have_content 'GreenFingersへようこそ！'
  	end

  	scenario '「花の広場」からトピック一覧へ' do
  	  click_on '花の広場'
  	  expect(page).to have_content '花の広場'
  	end

  	scenario '「会員登録」から会員登録ページへ' do
  	  click_on '会員登録'
  	  expect(page).to have_content '会員登録'
  	end

  	scenario '「ログイン」からログインページへ' do
  	  click_on 'ログイン'
  	  expect(page).to have_content 'ログイン'
  	end
  end

  feature 'ログイン時のテスト' do
  	let!(:user) { create(:user) }

  	background do
  	  sign_in user
  	  visit homes_top_path
  	end

  	scenario 'GreenFingersロゴからトップページへ' do
  	  click_on 'GreenFingers'
  	  expect(page).to have_content '新着記事'
  	end

  	scenario '「GreenFingersとは？」からアバウトページへ' do
  	  click_on 'Greenfingersとは？'
  	  expect(page).to have_content 'GreenFingersへようこそ！'
  	end

  	scenario 'TLからユーザのタイムラインへ' do
  	  click_on 'TL'
  	  expect(page).to have_content 'さんのタイムライン'
  	end

  	scenario '「マイページ」からユーザの詳細ページへ' do
  	  click_on 'マイページ'
  	  expect(page).to have_content 'さんが育てている花'
  	end

  	scenario '「皆の日記」から全日記一覧へ' do
  	  click_on '皆の日記'
  	  expect(page).to have_content '皆の日記'
  	end

  	scenario '「花の広場」からトピック一覧へ' do
  	  click_on '花の広場'
  	  expect(page).to have_content '花の広場（全トピック一覧'
  	end

  	scenario '「会員一覧」から全会員一覧へ' do
  	  click_on '会員一覧'
  	  expect(page).to have_content '全ユーザ一覧'
  	end

  	scenario '「ログアウト」でログアウトしてトップページへ' do
  	  click_on 'ログアウト'
  	  expect(page).to have_content 'ログアウトしました。'
  	  expect(page).to have_content '新着記事'
  	end
  end
end