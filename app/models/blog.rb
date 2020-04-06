class Blog < ApplicationRecord
	belongs_to :user

	validates :title, length: {maximum: 100}
	validates :content, length: {minimum: 2}
end
