class Blog < ApplicationRecord
	belongs_to :user
	has_many :blog_comments, dependent: :destroy
	has_many :stamps, dependent: :destroy

	validates :title, length: {minimum: 1, maximum: 100}
	validates :content, length: {minimum: 2}
	validates :plant_name, length: {minimum: 1, maximum: 20}
	validates :plant_kind, presence: true

	attachment :eyecatch_img
	acts_as_taggable
end
