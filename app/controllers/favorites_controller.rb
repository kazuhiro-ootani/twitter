class FavoritesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = Favorite.where(user_id: params[:id])
    render layout: 'show.application'

  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    current_user.favorite!(@tweet)
    redirect_to (:back)
  end

  def destroy
    @tweet = Favorite.find(params[:id]).tweet
    current_user.unfavorite!(@tweet)
    redirect_to (:back)
  end

end
