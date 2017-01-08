require './slashes_controller'

class Creep < SlashesController

  post '/creep' do
    key = $keys['creep']
    if key.blank? then
      {
        "color" => "yellow",
        "message" => "Key not found for creep!",
        "notify" => true,
        "message_format" => "text"
      }.to_json
    else
      {
        "color" => "green",
        "message" => "Found key for creep!",
        "notify" => false,
        "message_format" => "text"
      }.to_json
    end
  end

end
