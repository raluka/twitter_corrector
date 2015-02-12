class UserIO

  def read_input
    gets.chomp.downcase
  end

  def write_output(th, tc)

  end
end

class TwitterHandler

    def initialize
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_KEY")
      config.consumer_secret     = "key2"
    end
  end

  def last_tweet(username)
    @twitter_client.search(username)
  end

  private

  #search for client
  def search_for_user
    @twitter_client.search(@user)
  end
  #search for client's last tweet
  #return last tweet
end

class TweetCorrect

end


#############
user = UserIO.new
username = user.read_input
th = TwitterHandler.new.last_tweet(username)
tc = TweetCorrect.new(th)
user.write_output(th, tc)