class Topic < ApplicationRecord
	belongs_to :user

	validates :title, length: {minimum: 2, maximum: 100}
end
