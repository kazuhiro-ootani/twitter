class SearchController < ApplicationController

  def index
    @user = current_user
    @search_word = params[:keyword]
    @users = User.where(['nickname LIKE ?', "%#{@search_word}%"])
    render layout: 'search.application'
    
  end

  def tweet
    @user = current_user
    @search_word = params[:keyword]
    @tweets = Tweet.where(['text LIKE ?', "%#{@search_word}%"])
    render layout: 'search.application'
  end

end
