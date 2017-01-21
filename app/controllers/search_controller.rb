class SearchController < ApplicationController

  layout 'search.application'
  before_action :search_word, only: [:index, :tweet]

  def index
    @users = User.where(['nickname LIKE ?', "%#{@search_word}%"])
  end

  def tweet
    @tweets = Tweet.where(['text LIKE ?', "%#{@search_word}%"])
  end

  private

  def search_word
    @user = current_user
    @search_word = params[:keyword]
  end
end
