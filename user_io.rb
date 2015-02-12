class UserIO

  def read_input
    gets.chomp.downcase
  end

  def write_output(th, tc)

  end
end

class TwitterHandler
  # See: http://www.rubydoc.info/gems/twitter

    def initialize
      config = {
          consumer_key:    ENV.fetch("TWITTER_CONSUMER_KEY"),
          consumer_secret: ENV.fetch("TWITTER_CONSUMER_SECRET")
      }

     @twitter_client = Twitter::REST::Client.new(config)
  end

  def last_tweet(username)
    @twitter_client.user_timeline(username, count: 1).first.full_text
  end

end

class TweetCorrect
  def spell_checker(string)
    string.split(/\.(?=[\w])/)

  end
end


#############
user = UserIO.new
username = user.read_input
th = TwitterHandler.new.last_tweet(username)
tc = TweetCorrect.new(th)
user.write_output(th, tc)