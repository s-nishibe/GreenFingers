class Blog < ApplicationRecord

	default_scope -> { order(updated_at: :DESC) }

	belongs_to :user
	belongs_to :plant
	has_many :blog_comments, dependent: :destroy
	has_many :stamps, dependent: :destroy

	validates :title, length: {minimum: 1, maximum: 100}
	validates :content, length: {minimum: 2}

	attachment :eyecatch_img
	acts_as_taggable
end
