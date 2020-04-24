class BlogComment < ApplicationRecord
	belongs_to :user
	belongs_to :blog

	validates :comment, length: {maximum: 500}

	attachment :image
end
