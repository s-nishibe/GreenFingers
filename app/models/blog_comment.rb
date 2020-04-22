class BlogComment < ApplicationRecord
	belongs_to :user
	belongs_to :blog

    validates :user_id, presence: true
    validates :blog_id, presence: true
	validates :comment, length: {maximum: 500}

	attachment :image
end
