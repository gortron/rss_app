class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authorized
  #before_action :current_user

  def current_user
    @user = User.find_or_create_by(id: session[:user_id])
  end

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
