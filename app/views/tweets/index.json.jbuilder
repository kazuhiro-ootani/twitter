json.array! @feed_tweets do |tweet|
  json.text tweet.text
  json.created_at tweet.created_at
  json.nickname tweet.user.nickname
  json.username tweet.user.username
  json.user_img tweet.user.user_img

end
