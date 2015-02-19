require 'twitter'
require 'ffi/aspell'
class UserIO

  def read_input
    puts "Enter a twitter username"
    gets.chomp.downcase
  end

  def write_output(original_tweet, incorrect_words)
    puts "Last tweet from user is:\n #{original_tweet}"
    puts "This tweet has the following words spelled wrong:\n #{incorrect_words}"
  end
end

class TwitterHandler
  # See: http://www.rubydoc.info/gems/twitter

  def initialize
    config = twitter_keys
    @twitter_client = Twitter::REST::Client.new(config)
  end

  def last_tweet(username)
    @twitter_client.user_timeline(username, count: 1).first.full_text
  end

  private

  def twitter_keys
    {
        consumer_key: ENV.fetch("TWITTER_CONSUMER_KEY"),
        consumer_secret: ENV.fetch("TWITTER_CONSUMER_SECRET")
    }
  end

end

class TweetCorrect

  def self.wrong_words_from_tweet(string)
    word_array = string.split(/[\s,.]+/)
    incorrect_words = []
    word_array.each do |item|
      FFI::Aspell::Speller.open('en_US') do |speller|
        unless speller.correct?(item)
          incorrect_words << item
        end
      end
    end
    incorrect_words
  end

end

#############
user = UserIO.new
username = user.read_input
tweet = TwitterHandler.new.last_tweet(username)
incorrect_words = TweetCorrect.wrong_words_from_tweet(tweet)
user.write_output(tweet, incorrect_words)
