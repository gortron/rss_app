class SessionsController < ApplicationController
  def new
    current_user
  end

  def login # this is our 'CREATE'
    @user = User.find_by(username: params[:user][:username])
    @user = @user.try(:authenticate, params[:user][:password])
    unless @user
      flash[:errors] = "Could not find any username with that password."
      return redirect_to login_path 
    end
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect_to dashboard_path
  end

  def destroy # POST - logout_path
    session.delete :user_id
    session.delete :username
    redirect_to welcome_path
  end
end
