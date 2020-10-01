class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    tweet = Tweet.find(params[:tweet_id])
    current_user.favorite(tweet)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to tweets_path
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    current_user.unfavorite(tweet)
    flash[:success] = 'お気に入りから削除しました。'
    redirect_to tweets_path
  end
end
