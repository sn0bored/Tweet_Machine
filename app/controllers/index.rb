get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do

    @user = TwitterUser.find_or_create_by_username(params[:name])
    # p ((Time.now - @user.tweets.first.updated_at)/60) >= 20
    if @user.tweets.empty?
      @user.fetch_tweets!
    elsif ((Time.now - @user.tweets.first.created_at)/60) >= 20
      @user.tweets.delete_all
      p "elsif dnklndfl;njfl;sdnl;dsns;ldndl;"
      @user.fetch_tweets!
    end

    @tweets = @user.tweets
    erb :index
end

post '/:tweet_it' do
  
  tweet_input = params[:tweet]
  
  new_tweet = Tweet.create(tweet_input)
  
  

  Twitter.update(tweet_input)



  erb :index
end
