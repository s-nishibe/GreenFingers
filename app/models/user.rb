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

  has_many :user_relations
  has_many :followings, through: :user_relations, source: :follow
  has_many :reverse_of_user_relations, class_name: 'UserRelation', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_user_relations, source: :user

  validates :name, uniqueness: true, length: {minimum: 1, maximum: 20}
  validates :email, length: {minimum: 2, maximum: 50}
  validates :introduction, length: {maximum: 50}

  attachment :profile_img

  # twitter認証用
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.uid
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
  # twitterここまで

  # フォロー機能
  def follow(other_user)
    unless self == other_user
      self.user_relations.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    user_relation = self.user_relations.find_by(follow_id: other_user.id)
    user_relation.destroy if user_relation
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  # フォローここまで

end
