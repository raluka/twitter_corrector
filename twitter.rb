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

# get twitter user name

# find latest tweet

