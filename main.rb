require './slashes_controller'

# Global hash for storing HipChat API user-generated keys
$keys = { }

class Main < Sinatra::Base
  get '/' do
    "Hiya!"
  end

  get '/config' do
    "keys: #{$keys}"
  end

  post '/config/keys/:name' do |name|
    key = env[:request_json]['key']
    $keys[name] = key
    puts "Setting key for #{name} to #{key}"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

