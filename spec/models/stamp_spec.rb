require 'rails_helper'

RSpec.describe Stamp, type: :model do

  describe 'バリデーションのテスト' do
    let!(:user) { create(:user) }

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
