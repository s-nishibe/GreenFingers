require 'rails_helper'

RSpec.feature 'Blog機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:user2) { create(:user) }
    given!(:blog) { create(:blog, user_id: user.id) }
    given!(:blog_comment) { create(:blog_comment, user_id: user.id, blog_id: blog.id) }
    given!(:blog_comment) { create(:blog_comment, user_id: user2.id, blog_id: blog.id) }
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

  feature 'コメント投稿' do
  	scenario '正常にコメントを投稿できる' do
  	  fill_in '#blog_comment_comment', text: 'こめんと'
  	  click_button '送信！'
  	  expect(page).to have_selector '#comments_for_blog-1', text: 'こめんと'
  	end

  	scenario 'コメント欄が空欄だと投稿できない' do
  	  fill_in '#blog_comment_comment', text: ''
  	  click_button '送信！'
  	  expect(page).to_not have_selector '#comments_for_blog-1', text: 'こめんと'
  	end

  	scenario '500字以上のコメントは投稿できない' do
  	  fill_in '#blog_comment_comment', text: Faker::Lorem.character(number: 501)
  	  click_button '送信！'
  	  expect(page).to_not have_selector '#comments_for_blog-1', text: 'こめんと'
  	end

  	scenario '自分のコメントを削除できる' do
  	  click_button '削除'
  	  visit blog_blog_comments_path(blog_id: blog.id, bc_id: blog_commnt.id)
  	end

  	scenario '他者のコメントは削除できない' do
  	  expect(page).to_not have_link '削除', href: blog_blog_comments_path(user_id: user2.id, blog_id: blog.id, bc_id: blog_commnt.id)
  	end
  end

end