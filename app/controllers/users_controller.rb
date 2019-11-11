class UsersController < ApplicationController
  def new
  end

  def signup # this is our 'CREATE'
    # let's add a check here to see if username is already taken
    @user = User.create(user_params)
    unless @user.save
      flash[:errors] = "Please enter valid information for signup. Account not created."
      return redirect_to signup_path 
    end
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect_to dashboard_url(username: @user.username)
  end

  def dashboard
  end

  def folder_view
    @folder = params[:folder]
  end

  def feed_view
    @folder = params[:folder]
    @feed = params[:feed]
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end