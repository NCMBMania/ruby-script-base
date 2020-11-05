require "rack"
require 'json'

def call(env)
  req = Rack::Request.new(env)

  # HTTPメソッドの判別
  if req.post? || req.put?
    # ボディデータの取得
    params = JSON.parse(req.body.read)
    name = params['name'] || 'POST/PUT'
  end
  # GETの場合
  if req.get?
    name = req.params['name'] || 'GET'
  end
  # 独自のHTTPヘッダーを指定した場合
  puts req.get_header('HTTP_MYHEADER')
  # Content-Typeの取得
  puts req.content_type
  # HTTPメソッドの取得（GET/POST/PUT/DELETEなど）
  puts req.request_method
  [200, {"Content-Type" => "application/json"}, [{
    name: name
    }.to_json
  ]]
end
