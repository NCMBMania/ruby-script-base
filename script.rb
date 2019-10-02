require "rack"
require 'json'

def call(env)
  req = Rack::Request.new(env)
  name = req.params['name'] || 'Default'
  [200, {"Content-Type" => "application/json"}, [{
    name: name
  }.to_json]
  ]
end
