class TopicComment < ApplicationRecord
	belongs_to :user
	belongs_to :topic

    validates :user_id, presence: true
    validates :topic_id, presence: true
	validates :comment, length: {maximum: 500}

	attachment :image
end
