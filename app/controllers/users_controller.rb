class UsersController < ApplicationController
  def new
  end

  def signup
    @user = User.create(user_params)
    return redirect_to signup_path unless @user.save
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect_to dashboard_url(username: @user.username)
  end

  def dashboard
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end