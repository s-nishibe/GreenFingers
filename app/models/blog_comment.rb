class BlogComment < ApplicationRecord
	belongs_to :user
	belongs_to :blog

	validates :comment, length: {minimum: 1, maximum: 500}

	attachment :image
end
