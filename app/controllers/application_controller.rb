class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :current_user
  before_action :sign_in_required

  def tweet_app_settings
    Rails.application.config_for(:settings)[:tweet_app]
  end
end
