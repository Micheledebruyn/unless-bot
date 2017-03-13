require 'facebook/messenger'
include Facebook::Messenger
# NOTE: ENV variables should be set directly in terminal for testing on localhost

# Subcribe bot to your page
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  if message.text == "hello"
    message.reply(text: 'Yoyo, whaddup')
  else
    message.reply(text: 'Hello!')
  end
end