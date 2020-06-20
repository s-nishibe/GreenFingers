class Topic < ApplicationRecord

	default_scope -> { order(updated_at: :DESC) }

	belongs_to :user
	has_many :topic_comments, dependent: :destroy

	validates :title, length: {minimum: 2, maximum: 100}

	attachment :eyecatch_img

	scope :resolved, -> { where(status: true) }
	scope :unsolved, -> { where(status: false) }
end
