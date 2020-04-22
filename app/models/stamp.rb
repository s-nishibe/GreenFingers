class Stamp < ApplicationRecord
	belongs_to :user
	belongs_to :blog

	validates :user_id, presence: true
	validates :blog_id, presence: true
	validates :stamp_img, presence: true
end
