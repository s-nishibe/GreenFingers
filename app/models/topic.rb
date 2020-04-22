class Topic < ApplicationRecord
	belongs_to :user
	has_many :topic_comments, dependent: :destroy

    validates :user_id, presence: true
	validates :title, length: {minimum: 2, maximum: 100}

	attachment :eyecatch_img
end
