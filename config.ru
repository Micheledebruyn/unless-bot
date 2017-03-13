# require 'facebook/messenger'
# require 'sinatra-syslog'
# require_relative 'app'

# # use Sinatra::Syslog, "[sinatra] [#{ENV['APP_NAME']}-#{ENV['RACK_ENV']}] "
# # Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

# # map '/' do
# #   run(Sinatra::Application)
# # end

# # map "/bot" do
# #   run(Sinatra::Application)
# #   run(Facebook::Messenger::Server)
# # end


# # run Application

require 'facebook/messenger'
require_relative 'bot'

run Facebook::Messenger::Server
