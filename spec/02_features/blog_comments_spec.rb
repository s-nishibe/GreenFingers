require 'rails_helper'

RSpec.feature 'BlogComment機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:user2) { create(:user) }
    given!(:blog) { create(:blog, user_id: user.id) }
    sign_in user
    visit blog_path(blog)
  end

  feature '新規コメントフォーム表示' do
  	scenario '自分の名前が表示されている' do
  	  expect(page).to have_selector '.blog_comment_form', text: user.name
  	end

  	scenario '画像のアップローダーがある' do
  	  expect(page).to have_selector '#blog_comment_image'
  	end

  	scenario 'コメント欄がある' do
  	  expect(page).to have_selector '#blog_comment_comment'
  	end
  end

  feature '正常に投稿できる', js:true do
    background do
      fill_in '#blog_comment_comment', with: 'こめんと'
      click_button '送信！'
    end

    scenario '投稿するとコメント一覧に表示される' do
      expect(page).to have_selector '#comments_for_blog-1', text: 'こめんと'
    end

    scenario '削除ボタンを押すとコメントが消える' do
      click_button '削除'
      expect(page).to_not have_selector '#comments_for_topic-1', text: 'こめんと'
    end
  end

  feature 'バリデーションのテスト', js: true do
    scenario '1字以下だと投稿できない' do
      fill_in '#blog_comment_comment', with: ''
      click_button '送信！'
      expect(page).to_not have_selector '#comments_for_blog-1', text: ''
    end

    scenario '500字以上だと投稿できない' do
      fill_in '#blog_comment_comment', text: Faker::Lorem.character(numbre: 501)
      click_button '送信！'
      expect(page).to_not have_selector '#comments_for_blog-1', text: Faker::Lorem.character(numbre: 501)
    end

    scenario '他者のコメントは削除できない' do
      given!(:blog_comment) { create(:blog_comment, user_id: user2.id, blog_id: topic.id) }
      expect(page).to_not have_link '削除'
    end
  end

end