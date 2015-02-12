require 'twitter'
require_relative 'tweet_corrector'

# See: http://www.rubydoc.info/gems/twitter
twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "key1"
  config.consumer_secret     = "key2"
end

puts twitter_client.search("railsgirls")

#print question for user
def ask_twitterhandle
  puts "Tell me a twitterhandle!"
  gets.chomp.downcase

end
answer = ask_twitterhandle
tweet_corrector = TweetCorrector.new(twitter_client)

# get twitter user name
tweet_corrector.set_user(answer)

# find latest tweet
tweet = tweet_corrector.find_last_tweet

puts tweet # Should print tweet