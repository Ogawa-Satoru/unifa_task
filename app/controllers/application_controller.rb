class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :current_user
  before_action :sign_in_required
end
