require_relative "config/application"

class Application < Sinatra::Base
	configure do
		enable :logging, :show_exceptions, :dump_errors, :clean_trace, :static
	end

	get '/bot' do
		params['hub.challenge'] if ENV["VERIFY_TOKEN"] == params['hub.verify_token']
	end
end
