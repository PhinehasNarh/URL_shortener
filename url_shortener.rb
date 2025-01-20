require 'sinatra'
require 'securerandom'


url_database = {}

get '/' do
  "Welcome to the Ruby URL Shortener! Use the /shorten endpoint to shorten a URL. Codey by ph1n3y"
end

post '/shorten' do
  original_url = params['url']

  if original_url.nil? || original_url.strip.empty?
    status 400
    return "Error: URL parameter is required."
  end

  short_key = SecureRandom.hex(3)
  url_database[short_key] = original_url

  "Shortened URL: http://localhost:4567/#{short_key}"
end

get '/:short_key' do
  short_key = params['short_key']
  original_url = url_database[short_key]

  if original_url
    redirect original_url
  else
    status 404
    "Error: Short URL not found."
  end
end

#ph1n3y
