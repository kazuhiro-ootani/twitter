class RecommendController < ApplicationController
  def index
  @unfollow_recommend = User.recommend(current_user)
  end
end
