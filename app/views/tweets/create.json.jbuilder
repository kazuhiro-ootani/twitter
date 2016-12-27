  json.(@tweet, :text, :created_at, :user_id)
  json.(@tweet.user, :nickname, :username)
