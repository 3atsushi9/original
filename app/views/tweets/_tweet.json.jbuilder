json.extract! tweet, :id, :image, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
