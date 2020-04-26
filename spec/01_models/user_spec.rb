require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    let!(:user) { create(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        expect(user.valid?).to eq false;
      end

      it '20字以下であること' do
        user.name = Faker::Lorem.characters(number: 21)
        expect(user.valid?).to eq false;
      end
    end

    context 'emailカラム' do
      it '2字以上であること' do
        user.email = Faker::Lorem.characters(number: 1)
        expect(user.valid?).to eq false;
      end

      it '50字以下であること' do
        user.email = Faker::Lorem.characters(number: 51)
        expect(user.valid?).to eq false;
      end
    end

    context 'introductionカラム' do
      it '50字以下であること' do
        user.name = Faker::Lorem.characters(number: 51)
        expect(user.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Plantモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:plants).macro).to eq :has_many
      end
    end

    context 'Blogモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:blogs).macro).to eq :has_many
      end
    end

    context 'BlogCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:blog_comments).macro).to eq :has_many
      end
    end

    context 'Stampモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:stamps).macro).to eq :has_many
      end
    end

    context 'Topicモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:topics).macro).to eq :has_many
      end
    end

    context 'TopicCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:topic_comments).macro).to eq :has_many
      end
    end

    context 'Relationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:relationships).macro).to eq :has_many
      end
    end
  end

end
