require 'sinatra'

# Global hash for storing HipChat API user-generated keys
$keys = { }

before do
  raw_json_input = env['rack.request.form_input']
  if raw_json_input
    raw_json = raw_json_input.read
    if !raw_json.blank?
      env.update(:request_json => JSON.parse(raw_json, :create_additions => false))
    end
    raw_json_input.rewind # Someone else might need this?
  end
end

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

post '/creep' do
  {
    "color" => "green",
    "message" => "It's going to be sunny tomorrow! (yey)",
    "notify" => false,
    "message_format" => "text" 
  }.to_json
end

