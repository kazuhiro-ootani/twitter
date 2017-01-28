class TweetsController < ApplicationController
  before_action :auth_user

def index
  @tweet = Tweet.new
  @feed_tweets = current_user.feed.order('created_at DESC')
  @unfollow_recommend = User.recommend(current_user)
  respond_to do |format|
    format.html {}
    format.json
  end
end

def new

end

def create
  @tweet = Tweet.new(create_params)
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to :root }
        format.json
      end
    end

end


end

private
  def create_params
    params.require(:tweet).permit(:text).merge(user_id:current_user.id)
  end
