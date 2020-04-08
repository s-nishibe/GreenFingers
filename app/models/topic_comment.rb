class TopicComment < ApplicationRecord
	belongs_to :user
	belongs_to :topic

	validates :comment, length: {maximum: 500}

	attachment :image
end
