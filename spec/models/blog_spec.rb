require 'rails_helper'

RSpec.describe 'Blogモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let!(:user) { create(:user) }
    let!(:blog) { create(:blog, uesr_id: user.id) }

    context 'user_idカラム' do
      it '空欄でないこと' do
      end
    end

    context 'titleカラム' do
      it '空欄でないこと' do
      end
    end

    context 'contentカラム' do
      it '空欄でないこと' do
      end
    end

    context 'plant_nameカラム' do
      it '空欄でないこと' do
      end
    end

    context 'plant_kindカラム' do
      it '空欄でないこと' do
      end
    end

    context 'カラム' do
      it '空欄でないこと' do
      end
    end

    context 'カラム' do
      it '空欄でないこと' do
      end
    end

    context 'カラム' do
      it '空欄でないこと' do
      end
    end

    context 'カラム' do
      it '空欄でないこと' do
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Blog_comment.reflect_on_association(:blog).macro).to eq :belongs_to
      end
    end
  end


end
