class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  helper_method :current_user, :trades

      helper_method :trades

    def trades
        @trades = Trade.all
    end

  def authorize
    redirect_to login_path, alert: 'Not authorized - you must be logged in' if current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
