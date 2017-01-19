class RecommendController < ApplicationController
  def index
    recommend = User.where.not(id:current_user.id)
    unfollow_recommend = recommend.reject {|recommend| current_user.following?(recommend)}
    @unfollow_recommend = unfollow_recommend.sample(4)
  end
end
