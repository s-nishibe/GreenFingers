require 'rails_helper'

RSpec.feature 'TopicComment機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:user2) { create(:user) }
    given!(:topic) { create(:topic, user_id: user.id) }
    sign_in user
    visit topic_path(topic)
  end

  feature '新規コメントフォームの表示' do
  	scenario '自分の名前が表示されている' do
  	  expect(page).to have_selector '.topic_comment_form', text: user.name
  	end

  	scenario '画像のアップローダーがある' do
  	  expect(page).to have_selector '#topic_comment_image'
  	end

  	scenario 'コメント欄がある' do
  	  expect(page).to have_selector '#topic_comment_comment'
  	end
  end

  feature '正常に投稿できる', js:true do
  	background do
  	  fill_in '#topic_comment_comment', with: 'こめんと'
  	  click_button '送信！'
  	end

  	scenario '投稿するとコメント一覧に表示される' do
  	  expect(page).to have_selector '#comments_for_topic-1', text: 'こめんと'
    end

    scenario 'トピック一覧画面でのコメント数が増える' do
      visit topics_path(page: 'all_topics')
      expect(page).to have_selector '.tc_count', text: '1'
    end

    scenario '削除ボタンを押すとコメントが消える' do
      click_button '削除'
      expect(page).to_not have_selector '#comments_for_topic-1', text: 'こめんと'
    end

    scenario '削除するとトピック一覧画面でのコメント数が減る' do
      click_button '削除'
      visit topics_path(page: 'all_topics')
      expect(page).to have_selector '.tc_count', text: '0'
    end
  end

  feature 'バリデーションのテスト', js: true do
    scenario '1字以下だと投稿できない' do
      fill_in '#topic_comment_comment', with: ''
      click_button '送信！'
      expect(page).to_not have_selector '#comments_for_topic-1', text: ''
    end

    scenario '500字以上だと投稿できない' do
      fill_in '#topic_comment_comment', text: Faker::Lorem.character(numbre: 501)
      click_button '送信！'
      expect(page).to_not have_selector '#comments_for_topic-1', text: Faker::Lorem.character(numbre: 501)
    end

    scenario '他者のコメントは削除できない' do
      given!(:topic_comment) { create(:topic_comment, user_id: user2.id, topic_id: topic.id) }
      expect(page).to_not have_link '削除'
    end
  end

end