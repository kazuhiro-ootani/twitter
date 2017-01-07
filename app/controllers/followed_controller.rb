class FollowedController < ApplicationController

  def show
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @followed = user.followers
    render layout: 'show.application'
  end
end
