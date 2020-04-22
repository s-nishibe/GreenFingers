class Plant < ApplicationRecord
  belongs_to :user

  validates :name, length: {minimum: 1, maximum: 20}
  validates :kind, presence: true
  validates :memo, length: { minimum: 1, maximum: 200 }
end
