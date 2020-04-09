class Draft < ApplicationRecord
	belongs_to :user

	validates :title, length: {minimum: 1, maximum: 100}
	validates :content, length: {minimum: 2}

    attachment :eyecatch_img
    acts_as_taggable
end
