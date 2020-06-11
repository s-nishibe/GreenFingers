require 'rails_helper'

RSpec.feature 'Blogのテスト' do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:plant) { create(:plant, user_id: user.id) }
  let!(:blog) { create(:blog, user_id: user.id, plant_id: plant.id) }

  feature 'バリデーションのテスト' do
    scenario '花を登録しないと新規画面に遷移できない' do
      sign_in user2
      visit new_blog_path
      expect(page).to have_content '日記機能は花を登録してからご利用いただけます。さっそく花を登録してみましょう！'
    end
  end

  feature '新規保存のテスト' do
    background do
      sign_in user
      visit new_blog_path
    end

  	scenario '正常に下書き保存できる' do
  		fill_in 'タイトル', with: 'テスト投稿です！'
      fill_in '本文', with: '花はすくすく育っています'
      click_on '下書き保存'
      expect(page).to have_content '日記を下書き保存しました。'
  	end

    scenario '正常に公開できる' do
      fill_in 'タイトル', with: 'テスト投稿です！'
      fill_in '本文', with: '花はすくすく育っています'
      click_on '公開する！'
      expect(page).to have_content '日記を公開しました！ 下のツイートボタンで友達に知らせましょう！'
    end
  end

  feature '編集のテスト' do
    background do
      sign_in user
      visit edit_blog_path(blog)
    end

    scenario '正常に編集・下書き保存できる' do
      fill_in 'タイトル', with: 'テスト編集です～'
      click_on '下書き保存'
      expect(page).to have_content '下書きを更新しました！'
    end

    scenario '正常に編集・公開できる' do
      fill_in 'タイトル', with: 'テスト編集です～'
      click_on '公開する！'
      expect(page).to have_content '日記を公開しました！ 下のツイートボタンから更新のお知らせをしましょう！'
    end

    scenario '自分の記事を削除できる' do
      visit blog_path(blog)
      click_on '削除'
      expect(page).to have_content '日記を削除しました。'
    end
  end

  feature 'アクセス制限のテスト' do
    scenario '他者の記事は編集できない' do
      sign_in user2
      visit edit_blog_path(blog)
      expect(page).to have_content 'お探しのページにはアクセスできません。'
    end

    scenario '他者の記事を削除できない' do
      sign_in user2
      visit blog_path(blog)
      expect(page).to_not have_content '削除'
    end
  end
end