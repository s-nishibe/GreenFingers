class Draft < ApplicationRecord
	belongs_to :user

	validates :title, length: {maximum: 100}, default: '(no title)'
	validates :content, length: {minimum: 2}

    attachment :profile_img
    acts_as_taggable
end
