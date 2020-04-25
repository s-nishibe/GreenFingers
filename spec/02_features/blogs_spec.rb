require 'rails_helper'

RSpec.feature 'Blog機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:plant) { create(:plant, user_id: user.id) }
    given!(:blog) { create(:blog, user_id: user.id, plant_id: plant.id) }

    given!(:user2) { create(:user) }
    given!(:plant2) { create(:plant, user_id: user2.id) }
    given!(:blog2) { create(:blog, user_id: user2.id, plant_id: plant2.id) }
  end

  feature 'Blog一覧画面表示のテスト' do
  	background do
  	  sign_in user
  	  visit blogs_path(page: 'all_blogs')
  	end

  	scenario 'ユーザのアイコンからユーザの詳細へ' do
  	  click_link '.profile_img', href: user_path(user)
  	  expect(page).to have_content user.name + 'さんが育てている花'
    end

    scenario 'タイトルから日記の詳細へ' do
      click_link blog.title
      expect(page).to have_content blog.content
    end

    scenario 'タグをクリックでタグ絞り込み表示' do
      click_link '.badge', href: blos_path(tag_name: 'test')
      expect(page).to have_content 'タグ「test」の記事 全0件'
    end

    scenario '花の名前から花の詳細へ' do
      click_link blog.plant.name
      expect(page).to have_content plant.memo
    end

    scenario '自分の投稿に編集リンク' do
      expect(page).to have_link edit_blog_path(blog)
    end

    scenario '自分の投稿に削除リンク' do
      expect(page).to have_content blog_path(blog), method: :delete
    end

    scenario '他者の投稿には編集リンクなし' do
      expect(page).to_not have_link edit_blog_path(blog2)
    end

    scenario '他者の投稿には削除リンクなし' do
      expect(page).to_not have_content blog_path(blog2), method: :delete
    end
  end

  feature 'Blog投稿機能のテスト' do
  	scenario '正常に下書き保存できる' do
  	  fill_in 'タイトル', 'タイトル'
  	  fill_in '本文', 'ほんぶん'
  	  click_button '下書き保存'
  	  expect(page).to have_content '日記を下書き保存しました。'
    end

    scenario '正常に日記を公開できる' do
      fill_in 'タイトル', 'タイトル'
  	  fill_in '本文', 'ほんぶん'
  	  click_button '公開する！'
  	  expect(page).to have_content '日記を公開しました！ 下のツイートボタンで友達に知らせましょう！'
    end

    scenario 'タイトルを空欄にして下書きボタンを押すとエラーメッセージが出る' do
      fill_in '本文', 'ほんぶん'
      click_button '下書き保存'
      expect(page).to have_content '日記を保存できません。タイトルの文字数は1～100字、本文には2字以上が必要です。'
    end

    scenario 'タイトルを空欄にして公開ボタンを押すとエラーメッセージが出る' do
      fill_in '本文', 'ほんぶん'
      click_button '公開する！'
      expect(page).to have_content '日記を保存できません。タイトルの文字数は1～100字、本文には2字以上が必要です。'
    end
  end


end