class Tweet < ApplicationRecord

  belongs_to :user

  validates :text, presence: true

  def self.from_users_followed_by(user)
    following_ids = user.following_ids
    where("user_id IN (?) OR user_id = ?", following_ids, user)
  end
end
