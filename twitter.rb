require 'twitter'

# See: http://www.rubydoc.info/gems/twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "key1"
  config.consumer_secret     = "key2"
end

puts client.search("railsgirls")

#print question for user
def ask_twitterhandle
	puts "Tell me a twitterhandle!"
	answer = gets.chomp.downcase
end

tweet_corrector = TweetCorrector.new(client)

# get twitter user name
tweet_corrector.set_user

# find latest tweet
tweet = tweet_corrector.find_last_tweet

puts tweet # Should print tweet
