class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    last_ten_tweets = Twitter.user_timeline(self.username, count: 10)
    last_ten_tweets.each do |tweet|
      self.tweets << Tweet.create(content: tweet.text)
    end
  end

end
