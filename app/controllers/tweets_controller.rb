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
      slack_test
      respond_to do |format|
        format.html { redirect_to :root }
        format.json
      end
    end
end

end

private

  def slack_test
    if params[:tweet][:text] =~ /@管理者/
    tweet_text = @tweet.text.gsub(/@管理者|^¥s|/, '')
        text =

"ユーザーからメッセージが来ました。
-----------------------------


▼送信日時(送信時間)
 #{@tweet.created_at}

▼送信者(ユーザーID)
 @#{@tweet.user.username}

▼メッセージ内容
#{tweet_text}


-----------------------------"

    Slack.chat_postMessage(text: text, username: 'Twitter監視マン', channel: "#test")

    end
  end

  def create_params
    params.require(:tweet).permit(:text).merge(user_id:current_user.id)
  end
