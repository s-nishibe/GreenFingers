class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  has_many :drafts
  has_many :blogs
  has_many :blog_comments, through: :blogs
  has_many :stamps, through: :blogs
  has_many :topics
  has_many :topic_comments, through: :topics

  validates :name, uniqueness: true, length: {minimum: 1, maximum: 20}
  validates :email, length: {minimum: 2, maximum: 50}
  validates :introduction, length: {maximum: 50}

  attachment :profile_img

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

end
