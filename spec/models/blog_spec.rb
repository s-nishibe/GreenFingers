require 'rails_helper'

RSpec.describe 'Blogモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let!(:user) { create(:user) }
    let!(:blog) { create(:blog, uesr_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        blog.title = ''
        expect(blog.valid?).to eq false;
      end
    end

    context 'contentカラム' do
      it '空欄でないこと' do
        blog.content = ''
        expect(blog.valid?).to eq false;
      end
    end

  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Blog.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Plantモデルとの関係' do
      it 'N:1となっている' do
        expect(Blog.reflect_on_association(:plant).macro).to eq :belongs_to
      end
    end

    context 'BlogCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Blog.reflect_on_association(:blog_comments).macro).to eq :has_many
      end
    end

    context 'Stampモデルとの関係' do
      it '1:Nとなっている' do
        expect(Blog.reflect_on_association(:stamps).macro).to eq :has_many
      end
    end
  end


end
