helpers do
  
  def old?
    last_tweet = @user.tweets.first.updated_at
    how_old = ((Time.now - last_tweet)/60 >= 20)
    p how_old
  end

end
