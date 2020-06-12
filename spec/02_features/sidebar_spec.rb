require 'rails_helper'

RSpec.feature 'Sidebarのテスト' do
  let!(:user) { create(:user) }

  background do
    sign_in user
    visit homes_top_path
  end

  feature '画面遷移のテスト' do
  	scenario '「会員情報編集」から会員編集画面へ' do
  	  click_on '会員情報編集'
  	  expect(page).to have_content '会員情報編集'
  	end

  	scenario '「下書き一覧」から下書き一覧画面へ' do
  	  click_on '下書き一覧'
  	  expect(page).to have_content '下書き一覧'
  	end

  	scenario '「日記一覧」からその人の日記一覧へ' do
  	  click_on '日記一覧'
  	  expect(page).to have_content 'さんの日記'
  	end

  	scenario '「トピック一覧」からその人のトピック一覧へ' do
  	  click_on 'トピック一覧'
  	  expect(page).to have_content 'さんのトピック'
  	end

  	scenario '花が未登録の時は「新しい日記」を押すとマイページへ' do
  	  click_on '新しい日記'
  	  expect(page).to have_content '日記機能は花を登録してからご利用いただけます。さっそく花を登録してみましょう！'
  	end

  	scenario '花が登録済みの時は「新しい日記」から新規日記画面へ' do
  	  create(:plant, user_id: user.id)
  	  click_on '新しい日記'
  	  expect(page).to have_content '新しく日記をつける'
  	end

  	scenario '「新しいトピ」から新規トピック画面へ' do
  	  click_on '新しいトピ'
  	  expect(page).to have_content '新しくトピックを立てる'
  	end
  end
end