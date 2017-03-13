require 'csv'
require 'open-uri'
require 'json'
require 'facebook/messenger'
include Facebook::Messenger
# NOTE: ENV variables should be set directly in terminal for testing on localhost

# Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  # if message.text == "hello"
  #   message.reply(text: 'Yoyo, whaddup')
  # else
  #   message.reply(text: 'Hello!')
  # end
  

  message.reply(
    attachment: {
      type: 'image',
      payload: {
        url: Api.new.searcher(message.text)
      }
    }
    )
end


class Api
  def searcher(tag)
    api_url = "http://api.giphy.com/v1/gifs/search?q=#{tag}&api_key=dc6zaTOxFJmzC"
    open(api_url) do |stream|
      response = JSON.parse(stream.read)
      if response["data"] != []
        result = response["data"].sample["images"]["fixed_height"]["url"]
      else
        result = 'http://media1.giphy.com/media/F9AU77Krzw8ta/200.gif'
      end
    end
  end
end
