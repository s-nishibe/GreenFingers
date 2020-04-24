class Stamp < ApplicationRecord
	belongs_to :user
	belongs_to :blog

	validates :stamp_img, presence: true
end
