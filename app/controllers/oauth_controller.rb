class OauthController < ApplicationController
  require 'net/http'

  def create
    uri = URI(tweet_app_settings[:authorization_uri])

    uri.query = {
      response_type: "code",
      client_id: ENV["TWEET_APP_CLIENT_ID"],
      redirect_uri: tweet_app_settings[:redirect_uri]
    }.to_query

    redirect_to uri.to_s, allow_other_host: true
  end

  def callback
    uri = URI.parse(tweet_app_settings[:get_access_toke_uri])
    code = params[:code]

    params = {
      grant_type: "authorization_code",
      client_id: ENV["TWEET_APP_CLIENT_ID"],
      client_secret: ENV["TWEET_APP_CLIENT_SECRET"],
      redirect_uri: tweet_app_settings[:redirect_uri],
      code: code,
    }

    response = Net::HTTP.post_form(uri, params)
    session[:access_token] = JSON.parse(response.body)["access_token"]

    redirect_to photos_path
  end
end