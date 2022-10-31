class SessionsController < ApplicationController
  skip_before_action :sign_in_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(user_id: session_params[:user_id])

    if user && user.authenticate(session_params[:password])
      sign_in(user)
      redirect_to photos_path
    else
      flash.now[:alert] = alert_messages(user)
      render :new
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:user_id, :password)
  end

  def alert_messages(user)
    alert_messages = []
    alert_messages << I18n.t('errors.user.blank.user_id') if session_params[:user_id].blank?
    alert_messages << I18n.t('errors.user.blank.password') if session_params[:password].blank?
    alert_messages << I18n.t('errors.user.record_not_found') if alert_messages.blank? && (user.blank? || !user&.authenticate(session_params[:password]))
    alert_messages
  end
end
