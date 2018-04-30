class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user

  def current_user
    @login_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def render_404
      render file: "/public/404.html", status: 404
    # raise ActionController::RoutingError.new('Not Found')
  end
end
