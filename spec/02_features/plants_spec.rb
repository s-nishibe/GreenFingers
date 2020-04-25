require 'rails_helper'

RSpec.feature 'Plant機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:plant) { create(:plant, user_id: user.id) }
    visit user_path(user)
  end

  feature 'Plant画面表示' do
  	scenario 'ユーザ詳細ページから花の詳細へ' do
  	  expect(page).to have_link plant.name, href: plant_path(plant)
    end

    scenario '花の詳細ページにはその花についての日記一覧を表示' do
      visit plant_path(plant)
      expect(page).to have_content plant.blogs
    end
  end

  feature 'Plant投稿機能', js: true do
  	scenario '正常に保存できる' do
  	  fill_in '花の名前', 'はな'
  	  fill_in 'メモ', 'めも'
  	  click_button '登録！'
  	  expect(page).to have_selector '#plant-1', text: 'はな'
    end

    scenario '名前が空欄だと保存できない' do
      fill_in '花の名前', ''
  	  fill_in 'メモ', 'めも'
  	  click_button '登録！'
  	  expect(page).to_not have_selector '#plant-1', text: 'めも'
    end

    scenario '名前が20字以上だと保存できない' do
      fill_in '花の名前', Faker::Lorem.character(number: 21)
  	  fill_in 'メモ', 'めも'
  	  click_button '登録！'
  	  expect(page).to_not have_selector '#plant-1', text: 'めも'
    end

    scenario 'メモが200字以上だと保存できない' do
      fill_in '花の名前', 'はな'
  	  fill_in 'メモ', Faker::Lorem.character(number: 201)
  	  click_button '登録！'
  	  expect(page).to_not have_selector '#plant-1', text: 'はな'
    end
  end

  feature 'Plant編集機能', js: true do
  	background do
  	  fill_in '花の名前', 'はな'
  	  fill_in 'メモ', 'めも'
  	  click_button '登録！'
  	  click_link '編集'
  	end

  	scenario '編集ボタンを押すとフォームにデータが入力される' do
  	  expect(page).to have_field '花の名前', with: 'はな'
  	  expect(page).to have_field 'メモ', with: 'めも'
  	end

  	scenario '正常に更新できる' do
  	  fill_in '花の名前', 'はな！'
  	  fill_in 'メモ', 'めも？'
  	  click_button '登録！'
  	  expect(page).to have_selector '#plant-1', text: 'はな！'
  	end

  	scenario '名前が空欄だと更新できない' do
  	  fill_in '花の名前', ''
  	  fill_in 'メモ', 'めも'
  	  click_button '登録！'
  	  expect(page).to_not have_selector '#plant-1', text: 'めも'
  	end

  	scenario '名前が20字以上だと更新できない' do
  	  fill_in '花の名前', Faker::Lorem.character(number: 21)
  	  fill_in 'メモ', 'めも'
  	  click_button '登録！'
  	  expect(page).to_not have_selector '#plant-1', text: 'めも'
  	end

  	scenario 'メモが200字以上だと更新できない' do
  	  fill_in '花の名前', 'はな！'
  	  fill_in 'メモ', Faker::Lorem.character(number: 201)
  	  click_button '登録！'
  	  expect(page).to_not have_selector '#plant-1', text: 'はな！'
  	end
  end

end