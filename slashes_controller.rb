require 'sinatra/base'

class SlashesController < Sinatra::Base
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

  # Extend this class to create a new controller
end
