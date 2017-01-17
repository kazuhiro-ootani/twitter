class TweetsController < ApplicationController
  before_action :auth_user

def index
@tweet = Tweet.new
@tweets = Tweet.order('created_at DESC').limit(20)
@tweeto = current_user.tweets.build
@feed_tweets = current_user.feed.order('created_at DESC')
@recommend = User.all.sample(3)
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

def edit
end

end

private
  def create_params
    params.require(:tweet).permit(:text).merge(user_id:current_user.id)
  end
