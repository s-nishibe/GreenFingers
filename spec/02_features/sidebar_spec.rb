require 'rails_helper'

RSpec.feature 'サイドバーのテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:user2) { create(:user) }
    visit homes_top_path
  end

  scenario '未ログイン時はサイドバーを表示しない' do
  	expect(page).to_not have_content 'User Info'
  end


  feature '自分に関する情報' do
  	background do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
    end

    scenario 'アイコン画像からマイページへ遷移' do
      expect(page).to have_selector '.profile_img', href: user_path(user)
    end

    scenario '自分の名前を表示' do
      expect(page).to have_content user.name
    end

    scenario '自己紹介を表示' do
      expect(page).to have_content user.introduction
    end

    scenario 'フォローのリンクからフォローしたユーザ一覧へ遷移' do
      expect(page).to have_link '0フォロー', href: users_path(who: 'followings', user_id: user.id)
    end

    scenario 'フォロワーのリンクからフォローされたユーザ一覧へ遷移' do
      expect(page).to have_link '0フォロワー', href: users_path(who: 'followers', user_id: user.id)
    end

    scenario '「会員情報編集」から会員情報編集ページへ遷移' do
      expect(page).to have_link '会員情報編集', href: edit_user_path(user)
    end

    scenario '「下書き一覧」から下書き一覧画面へ遷移' do
      expect(page).to have_link '下書き一覧', href: blogs_path(page: 'drafts', id: current_user.id)
    end

    scenario '「日記一覧」から公開済みの日記一覧へ遷移' do
      expect(page).to have_link '日記一覧', href: blogs_path(page: 'user_blogs', id: current_user.id)
    end

    scenario '「トピック一覧」から自分が立てたトピック一覧へ遷移' do
      expect(page).to have_link 'トピック一覧', href: topics_path(page: 'user_topics', id: current_user.id)
    end

    scenario '「新しい日記」から新規Blog画面へ遷移' do
      expect(page).to have_link '新しい日記', href: new_blog_path
    end

    scenario '「新しいトピ」から新規Topic画面へ遷移' do
      expect(page).to have_link '新しいトピ', href: new_topic_path
    end
  end

  feature '他者に関する情報' do
  	background do
  	  visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
      visit user_path(user2)
    end

    scenario 'アイコン画像からその人の会員ページへ遷移' do
      expect(page).to have_selector '.profile_img', href: user_path(id: user2.id)
    end

    scenario 'ユーザの名前を表示' do
      expect(page).to have_content user2.name
    end

    scenario 'ユーザの自己紹介を表示' do
      expect(page).to have_content user2.introduction
    end

    scenario 'フォローのリンクからフォローしたユーザ一覧へ遷移' do
      expect(page).to have_link '0フォロー', href: users_path(who: 'followings', user_id: user2.id)
    end

    scenario 'フォロワーのリンクからフォローされたユーザ一覧へ遷移' do
      expect(page).to have_link '0フォロワー', href: users_path(who: 'followers', user_id: user2.id)
    end

    scenario '「フォローする」ボタンでその人をフォロー', js: true do
      click_button 'フォローする'
      expect(page).to have_button 'フォロー中'
    end

    scenario '「フォロー中」ボタンでフォローを解除', js: true do
      click_button 'フォロー中'
      expect(page).to have_button 'フォローする'
    end

    scenario '「この人の日記」からユーザの日記一覧へ遷移' do
      expect(page).to have_link 'この人の日記', herf: blogs_path(id: user2.id, page: 'users_blogs')
    end

    scenario '「この人が立てたトピ」からユーザのトピック一覧へ遷移' do
      expect(page).to have_link 'この人が立てたトピ', href: topics_path(id: user2.id, page: 'user_topics')
    end
  end

end