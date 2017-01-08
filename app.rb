require 'sinatra'

# Global hash for storing HipChat API user-generated keys
$keys = { }

before do
  raw_json_input = env['rack.request.form_input']
  if raw_json_input
    env.update(:request_json => JSON.parse(raw_json_input.read, :create_additions => false))
    raw_json_input.rewind # Someone else might need this?
  end
end

get '/' do
  "keys: #{$keys}"
end

post '/keys/:name' do |name|
  key = env[:request_json]['key']
  $keys[name] = key
  puts "Setting key for #{name} to #{key}"
end

