class Plant < ApplicationRecord
  belongs_to :user
  has_many :blogs, dependent: :destroy

  validates :name, length: {minimum: 1, maximum: 20}
  validates :memo, length: { maximum: 200 }
end
