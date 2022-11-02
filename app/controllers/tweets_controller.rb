class TweetsController < ApplicationController
  def create
    photo = Photo.find(params[:photo])
    uri = URI.parse(tweet_app_settings[:post_tweet_uri])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme === "https"

    params = { text: photo.title, url: photo.url}
    headers = { "Content-Type" => "application/json", "Authorization" => "Bearer #{session[:access_token]}" }
    http.post(uri.path, params.to_json, headers)

    redirect_to photos_path
  end
end