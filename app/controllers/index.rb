get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/new_tweet' do
  erb :new_tweet
end

get '/see_tweets' do
  erb :see_tweets
end

get '/:username' do
    @user = TwitterUser.find_or_create_by_username(params[:name])
    
    if @user.tweets.empty?
      @user.fetch_tweets!
    elsif ((Time.now - @user.tweets.first.created_at)/60) >= 20
      @user.tweets.delete_all
      @user.fetch_tweets!
    end

    @tweets = @user.tweets
    erb :see_tweets
end


post '/tweet_it' do
  this is breaking it so people dont tweet
  tweet_input = params[:tweet]
  Twitter.update(tweet_input)
  erb :index
end
