require 'rails_helper'

RSpec.describe 'Plantモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    before do
      let!(:user) { create(:user) }
      let!(:plant) { create(:plant, user_id: user.id) }
    end

    context 'nameカラム' do
      it '空欄でないこと' do
        plant.name = ''
        expect(plant.valid?).to eq false;
      end

      it '20字以下であること' do
        plant.name = Faker::Lorem.character(number: 21)
        expect(plant.valid?).to eq false;
      end
    end

    context 'memoカラム' do
      it '空欄でないこと' do
        plant.memo = ''
        expect(plant.valid?).to eq false;
      end

      it '200字以下であること' do
        plant.memo = Faker::Lorem.character(number: 201)
        expect(plant.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Plant.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Blogモデルとの関係' do
      it 'N:1となっている' do
        expect(Plant.reflect_on_association(:blog).macro).to eq :belongs_to
      end
    end
  end


end
