class SessionsController < ApplicationController
  def new
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    @user = @user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless @user
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect_to dashboard_path(username: @user.username)
  end

  def destroy
    session.delete :user_id, :username
    redirect_to root_path
  end
end
