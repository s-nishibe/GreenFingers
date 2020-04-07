class Topic < ApplicationRecord
	belongs_to :user
	has_many :topic_comments

	validates :title, length: {minimum: 2, maximum: 100}
end
