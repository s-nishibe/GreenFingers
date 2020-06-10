require 'rails_helper'

RSpec.describe 'TopicCommentモデルのテスト', type: :model do

  describe 'バリデーションのテスト' do
    context 'commentカラム' do
      let!(:user) { create(:user) }
      let!(:topic) { create(:topic, user_id: user.id) }
      let!(:topic_comment) { create(:topic_comment, user_id: user.id, topic_id: topic.id) }

      it '500字以下であること' do
        topic_comment.comment = Faker::Lorem.characters(number: 501)
        expect(topic_comment.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(TopicComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Topicモデルとの関係' do
      it 'N:1となっている' do
        expect(TopicComment.reflect_on_association(:topic).macro).to eq :belongs_to
      end
    end
  end

end
