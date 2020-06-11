require 'rails_helper'

RSpec.feature 'Topicのテスト' do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:topic) { create(:topic, user_id: user.id) }

  feature '新規作成のテスト' do
  	background do
  	  sign_in user
  	  visit new_topic_path
  	end

  	scenario '正常に新規保存できる' do
  	  fill_in 'タイトル', with: '初投稿です！'
  	  fill_in '本文', with: '初めてトピックを立てました！'
  	  click_on 'トピを立てる！'
  	  expect(page).to have_content '新しいトピックが立ちました！'
  	end

  	scenario 'タイトルが空欄だと保存できない' do
  	  fill_in 'タイトル', with: ''
  	  fill_in '本文', with: '初めてトピックを立てました！'
  	  click_on 'トピを立てる！'
  	  expect(page).to have_content 'トピックを立てられません。タイトルの文字数は2字から100字です。'
  	end

  	scenario '本文が空欄だと保存できない' do
  	  fill_in 'タイトル', with: '初投稿です！'
  	  fill_in '本文', with: ''
  	  click_on 'トピを立てる！'
  	  expect(page).to have_content 'トピックのコメントを送信できませんでした。コメントの文字数は1字から500字です。'
  	end
  end

  feature '編集のテスト' do
  	background do
  	  sign_in user
  	  visit edit_topic_path(topic)
  	end
  	scenario '正常にタイトル変更できる' do
  	  fill_in 'タイトル', with: '2回目の投稿です！'
  	  click_on 'トピを立てる！'
  	  expect(page).to have_content 'トピックが更新されました！'
  	end

  	scenario 'タイトルが空欄だと更新できない' do
  	  fill_in 'タイトル', with: ''
  	  click_on 'トピを立てる！'
  	  expect(page).to have_content 'トピックを更新できませんでした。'
  	end

  	scenario 'トピックを削除できる' do
  	  visit topic_path(topic)
  	  find('#delete_topic').click
  	  expect(page).to have_content 'トピックが削除されました。'
  	end
  end

  feature 'アクセス制限のテスト' do
  	scenario '他者が立てたトピックは編集できない' do
  	  sign_in user2
  	  visit edit_topic_path(topic)
  	  expect(page).to have_content 'お探しのページにアクセスできませんでした。'
  	end

  	scenario '他者が立てたトピックは削除できない' do
  	  sign_in user2
  	  expect(page).to_not have_selector '#delete_topic'
  	end
  end
end