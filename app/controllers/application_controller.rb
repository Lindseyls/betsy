class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user

  def current_user
    @login_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
