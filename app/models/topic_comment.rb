class TopicComment < ApplicationRecord
	belongs_to :user
	belongs_to :topic

	validates :comment, length: {minimum: 1, maximum: 500}

	attachment :image
end
