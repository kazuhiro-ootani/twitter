class UsersController < ApplicationController

  def index
    @tweets = current_user.tweets.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.all
    render layout: 'show.application'
  end

end
