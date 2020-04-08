class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs
  has_many :blog_comments, through: :blogs
  has_many :stamps, through: :blogs
  has_many :topics
  has_many :topic_comments, through: :topics

  validates :name, uniqueness: true, length: {minimum: 1, maximum: 20}
  validates :email, length: {minimum: 2, maximum: 50}
  validates :introduction, length: {maximum: 50}

  attachment :profile_img

end
