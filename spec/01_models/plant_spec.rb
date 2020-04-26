require 'rails_helper'

RSpec.describe 'Plantモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let!(:user) { create(:user) }
    let!(:plant) { create(:plant, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        plant.name = ''
        expect(plant.valid?).to eq false;
      end

      it '20字以下であること' do
        plant.name = Faker::Lorem.characters(number: 21)
        expect(plant.valid?).to eq false;
      end
    end

    context 'memoカラム' do
      it '200字以下であること' do
        plant.memo = Faker::Lorem.characters(number: 201)
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
      it '1:Nとなっている' do
        expect(Plant.reflect_on_association(:blogs).macro).to eq :has_many
      end
    end
  end


end
