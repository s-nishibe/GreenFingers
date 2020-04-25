require 'rails_helper'

RSpec.feature 'Blog機能のテスト' do
  background do
    given!(:user) { create(:user) }
    given!(:blog) { create(:blog, user_id: user.id) }
    given!(:blog_comment) { create(:blog_comment, user_id: user.id, blog_id: blog.id) }
  end

  feature '' do
  	scenario do
  	end
  end

end