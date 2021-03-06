class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
      flash[:notice] = "ツイートを送信しました。"
    else
      redirect_to new_tweet_path
      flash[:notice] = "ツイートに失敗しました。"
    end
  end

  private
   def tweet_params
     params.require(:tweet).permit(:text).merge(user_id: current_user.id)
   end

end
