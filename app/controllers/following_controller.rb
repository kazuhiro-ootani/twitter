class FollowingController < ApplicationController

  def show
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @following = user.following
  end
end
