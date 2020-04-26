require 'rails_helper'

RSpec.describe 'Topicモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    before do
      let!(:user) { create(:user) }
      let!(:topic) { create(:topic, user_id: user.id) }
    end

    context 'titleカラム' do
      it '空欄でないこと' do
        topic.title = ''
        expect(topic.valid?).to eq false;
      end

      it '100字以下であること' do
        topic.title = Faker::Lorem.character(number: 101)
        expect(topic.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Topic.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'TopicCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Topic.reflect_on_association(:topic_comments).macro).to eq :has_many
      end
    end
  end

end
