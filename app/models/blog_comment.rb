class BlogComment < ApplicationRecord
	belongs_to :user
	belongs_to :blog

	validates :content, length: {maximum: 500}

	attachment :image
end
