require 'rails_helper'

RSpec.feature 'Topic機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:user2) { create(:user) }
    sign_in user
    visit new_topic_path
  end

  feature '新規投稿のテスト' do
  	scenario 'タイトル・コメントとも保存できる' do
  	  fill_in '#topic_title', with: 'とぴっく'
  	  fill_in '#topic_topic_comment_comment', with: 'こめんと'
  	  click_button 'トピを立てる！'
  	  expect(page).to have_content '新しいトピックが立ちました！'
    end

    scenario 'タイトルが2字以下だとエラーメッセージが出る' do
      fill_in '#topic_title', with: ''
  	  fill_in '#topic_topic_comment_comment', with: 'こめんと'
  	  click_button 'トピを立てる！'
  	  expect(page).to have_content 'トピックを立てられません。タイトルの文字数は2字から100字です。'
    end

    scenario 'タイトルが100字以上だとエラーメッセージが出る' do
      fill_in '#topic_title', with: Faker::Lorem.character(number: 101)
  	  fill_in '#topic_topic_comment_comment', with: 'こめんと'
  	  click_button 'トピを立てる！'
  	  expect(page).to have_content 'トピックを立てられません。タイトルの文字数は2字から100字です。'
    end

    scenario 'コメントが空欄だとエラーメッセージが出る' do
      fill_in '#topic_title', with: 'とぴっく'
  	  fill_in '#topic_topic_comment_comment', with: ''
  	  click_button 'トピを立てる！'
  	  expect(page).to have_content 'トピックのコメントを送信できませんでした。コメントの文字数は1字から500字です。'
    end

    scenario 'コメントが500字以上だとエラーメッセージが出る' do
      fill_in '#topic_title', with: 'とぴっく'
  	  fill_in '#topic_topic_comment_comment', with: Faker::Lorem.character(number: 501)
  	  click_button 'トピを立てる！'
  	  expect(page).to have_content 'トピックのコメントを送信できませんでした。コメントの文字数は1字から500字です。'
    end
  end

  feature '一覧画面の表示' do
  	background do
  	  given!(:topic) { create(:topic, user_id: user.id) }
  	  visit topics_path(page: 'all_topics')
  	end
  	scenario 'アイキャッチ画像から詳細画面へ' do
  	  expect(page).to have_selector '.eyecatch_img', href: topic_path(topic)
    end

    scenario 'タイトルから詳細画面へ' do
      expect(page).to have_link topic.title, href: topic_path(topic)
    end

    scenario 'カテゴリからカテゴリ毎の一覧へ' do
      expect(page).to have_link topic.category, href: topics_path(page: 'category')
    end

    scenario '「タイトルを変更」リンクの表示' do
      expect(page).to have_link 'タイトルを変更', href: edit_topic_path(topic)
    end

    scenario '「削除」リンクの表示' do
      expect(page).to have_link '削除', href: topic_path(topic), method: :delete
    end

    scenario '「削除」を押すとトピックが削除される' do
      click_link '削除'
      expect(page).to_not have_content topic.title
    end

    scenario '他者のトピックには「タイトルを変更」リンクはない' do
      given!(:topic2) { create(:topic, user_id: user2.id) }
      expect(page).to have_link 'タイトルを変更', href: edit_topic_path(topic2)
    end

    scenario '他者のトピックには「削除」リンクはない' do
      expect(page).to have_link '削除', href: topic_path(topic2), method: :delete
    end
  end

  feature '詳細画面の表示' do
  	background do
  	  given!(:topic) { create(:topic, user_id: user.id) }
  	  visit topic_path(topic)
  	end

  	scenario '「未解決」を押すと「解決済み」になる' do
  	  click_link '未解決'
  	  expect(page).to have_content '解決済み'
    end

    scenario '「解決済み」を押すと「未解決」になる' do
      click_link '解決済み'
  	  expect(page).to have_content '未解決'
    end

    scenario '「タイトルを変更」リンクの表示' do
      expect(page).to have_link 'タイトルを変更', href: edit_topic_path(topic)
    end

    scenario '他者のトピックはタイトル変更できない' do
      given!(:topic2) { create(:topic, user_id: user2.id) }
      visit edit_topic_path(topic2)
      expect(page).to have_content 'お探しのページにアクセスできませんでした。'
    end
  end

end