require 'rails_helper'

RSpec.feature 'Stamp機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:blog) { create(:blog, user_id: user.id) }
    sign_in user
    visit blog_path(blog)
  end

  feature 'いいねスタンプを押す', js: true do
  	background do
  	  click_link '0いいね'
  	end
  	scenario 'アイコンに色がつく' do
  	  expect(page).to have_selector '.fas fa-thumbs-up fa-2x'
    end

    scenario 'カウント数が増える' do
      expect(page).to have_content '1いいね'
    end

    scenario 'ブログ一覧のスタンプ数表示が増える' do
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '1'
    end

    scenario '2回押すとアイコンが白抜きに戻る' do
      click_link '1いいね'
      expect(page).to have_selector '.far fa-thumbs-up fa-2x'
    end

    scenario '2回押すとカウント数が戻る' do
      click_link '1いいね'
      expect(page).to have_content '0いいね'
    end

    scenario 'ブログ一覧のスタンプ数表示が戻る' do
      click_link '1いいね'
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '0'
    end
  end

  feature 'なるほどスタンプを押す', js: true do
  	background do
  	  click_link '0なるほど'
  	end
  	scenario 'アイコンに色がつく' do
  	  expect(page).to have_selector '.fas fa-lightbulb fa-2x'
    end

    scenario 'カウント数が増える' do
      expect(page).to have_content '1なるほど'
    end

    scenario 'ブログ一覧のスタンプ数表示が増える' do
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '1'
    end

    scenario '2回押すとアイコンが白抜きに戻る' do
      click_link '1なるほど'
      expect(page).to have_selector '.far fa-lightbulb fa-2x'
    end

    scenario '2回押すとカウント数が戻る' do
      click_link '1なるほど'
      expect(page).to have_content '0なるほど'
    end

    scenario 'ブログ一覧のスタンプ数表示が戻る' do
      click_link '1なるほど'
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '0'
    end
  end

  feature 'おもしろい！スタンプを押す', js: true do
  	background do
  	  click_link '0おもしろい！'
  	end
  	scenario 'アイコンに色がつく' do
  	  expect(page).to have_selector '.fas fa-grin-squint-tears fa-2x'
    end

    scenario 'カウント数が増える' do
      expect(page).to have_content '1おもしろい！'
    end

    scenario 'ブログ一覧のスタンプ数表示が増える' do
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '1'
    end

    scenario '2回押すとアイコンが白抜きに戻る' do
      click_link '1おもしろい！'
      expect(page).to have_selector '.far fa-grin-squint-tears fa-2x'
    end

    scenario '2回押すとカウント数が戻る' do
      click_link '1おもしろい！'
      expect(page).to have_content '0おもしろい！'
    end

    scenario 'ブログ一覧のスタンプ数表示が戻る' do
      click_link '1おもしろい！'
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '0'
    end
  end

  feature 'スタースタンプを押す', js: true do
  	background do
  	  click_link '0スター'
  	end
  	scenario 'アイコンに色がつく' do
  	  expect(page).to have_selector '.fas fa-star fa-2x'
    end

    scenario 'カウント数が増える' do
      expect(page).to have_content '1スター'
    end

    scenario 'ブログ一覧のスタンプ数表示が増える' do
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '1'
    end

    scenario '2回押すとアイコンが白抜きに戻る' do
      click_link '1スター'
      expect(page).to have_selector '.far fa-star fa-2x'
    end

    scenario '2回押すとカウント数が戻る' do
      click_link '1スター'
      expect(page).to have_content '0スター'
    end

    scenario 'ブログ一覧のスタンプ数表示が戻る' do
      click_link '1スター'
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '0'
    end
  end

  feature 'ありがとうスタンプを押す', js: true do
  	background do
  	  click_link '0ありがとう'
  	end
  	scenario 'アイコンに色がつく' do
  	  expect(page).to have_selector '.fas fa-smile fa-2x'
    end

    scenario 'カウント数が増える' do
      expect(page).to have_content '1ありがとう'
    end

    scenario 'ブログ一覧のスタンプ数表示が増える' do
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '1'
    end

    scenario '2回押すとアイコンが白抜きに戻る' do
      click_link '1ありがとう'
      expect(page).to have_selector '.far fa-smile fa-2x'
    end

    scenario '2回押すとカウント数が戻る' do
      click_link '1ありがとう'
      expect(page).to have_content '0ありがとう'
    end

    scenario 'ブログ一覧のスタンプ数表示が戻る' do
      click_link '1ありがとう'
      visit blogs_path(page: 'all_blogs')
      expect(page).to have_selector '.stamp_count', text: '0'
    end
  end

end