class TweetsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = current_user.feed_tweets.order(id: :desc).page(params[:page])
    @tweet = current_user.tweets.build
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)

    #respond_to do |format|
      if @tweet.save
        flash[:success] = 'ツイートを投稿しました。'
        redirect_to tweets_path
        #format.html { redirect_to @tweet }
        #format.json { render :show, status: :created, location: @tweet }
      else
        @tweets = current_user.feed_tweets.order(id: :desc).page(params[:page])
        flash.now[:danger] = 'ツイートを投稿できませんでした。'
        render 'tweets/index'
        #format.html { render :new }
        #format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
      redirect_to tweets_path
    #respond_to do |format|
      #format.html { redirect_to tweets_url }
      #format.json { head :no_content }
    #end
  end

    private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:image, :content)
    end
    
    def correct_user
      @tweet = current_user.tweets.find_by(id: params[:id])
      unless @tweet
        redirect_to root_url
      end
    end
end    

