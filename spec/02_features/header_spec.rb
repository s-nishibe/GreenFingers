require 'rails_helper'

RSpec.feature 'ヘッダーのテスト' do

  # 検索機能のテストについては別ファイルにて実施

  feature 'ログイン前のリンク遷移' do
      background do
        visit homes_top_path
      end

  	  scenario 'リンク付きロゴ画像からTopページへ遷移' do
        expect(page).to have_selector '#GreenFingers', href: homes_top_path
      end

      scenario '「GreenFingersとは？」からAboutページへ遷移' do
        expect(page).to have_link 'GreenFingersとは？', href: homes_about_path
      end

      scenario '「花の広場」からTopic一覧画面へ遷移' do
        expect(page).to have_link '花の広場', href: topics_path(page: 'all_topics')
      end

      scenario '「ログイン」からsign_in画面への遷移' do
        expect(page).to have_link 'ログイン', href: new_user_session_path
      end

      scenario '「新規登録」からsign_up画面へ遷移' do
        expect(page).to have_link '会員登録', href: new_user_registration_path
      end
  end

  feature 'ログイン後のリンク遷移' do
  	given!(:user) { create(:user) }

  	background do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
    end

  	  scenario 'リンク付きロゴ画像からTopページへ遷移' do
        expect(page).to have_selector '#GreenFingers', href: homes_top_path
      end

      scenario '「GreenFingersとは？」からAboutページへ遷移' do
        expect(page).to have_link 'GreenFingersとは？', href: homes_about_path
      end

      scenario '「TL」からフォローしている人の日記一覧へ遷移' do
        expect(page).to have_link 'TL', href: blogs_path(page: 'TL')
      end

      scenario '「マイページ」から自分のユーザ画面へ遷移' do
        expect(page).to have_link 'マイページ', href: user_path(current_user)
      end

      scenario '「皆の日記」から全Blogs一覧へ遷移' do
        expect(page).to have_link '皆の日記', href: blogs_path(page: 'all_blogs')
      end

      scenario '「花の広場」から全Topic一覧へ遷移' do
        expect(page).to have_link '花の広場', href: topics_path(page: 'all_topics')
      end

      scenario '「会員一覧」から全User一覧へ遷移' do
        expect(page).to have_link '会員一覧', href: users_path(who: 'all_users')
      end

      scenario '「ログアウト」からsign_out処理、Topページに戻る' do
        expect(page).to have_link 'ログアウト', href: destroy_user_session_path
        expect(page).to have_content 'h2', '新着記事'
      end
  end

end