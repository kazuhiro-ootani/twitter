class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, format: { with: /\A[0-9A-Za-z]+\z/ }

  has_many :tweets
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :favorites
  has_many :favorite_tweets, through: :favorites, source: :tweet

  def favorite?(tweet)
    favorites.find_by(tweet_id: tweet.id)
  end

  def favorite!(tweet)
    favorites.create!(tweet_id: tweet.id)
  end

  def unfavorite!(tweet)
    favorites.find_by(tweet_id: tweet.id).destroy
  end


  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def feed
    Tweet.from_users_followed_by(self)
  end

  default_value_for :user_img, "http://zanex.wp-x.jp/wp-content/uploads/2015/07/o0800080011801224596.jpg"
  default_value_for :header_img, "http://photosku.com/img/slick/02.jpg"

end
