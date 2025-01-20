require 'sinatra'
require 'securerandom'

# In-memory hash to store URLs
url_database = {}

# Home page (optional)
get '/' do
  "Welcome to the Ruby URL Shortener! Use the /shorten endpoint to shorten a URL."
end

# Route to shorten a URL
post '/shorten' do
  original_url = params['url']

  if original_url.nil? || original_url.strip.empty?
    status 400
    return "Error: URL parameter is required."
  end

  # Generate a unique short key
  short_key = SecureRandom.hex(3)
  url_database[short_key] = original_url

  "Shortened URL: http://localhost:4567/#{short_key}"
end

# Route to redirect to the original URL
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
