class UsersController < ApplicationController

  def new
  end

  def create # this is our 'CREATE'
    # let's add a check here to see if username is already taken
    @user = User.create(user_params)

    unless @user.save
      flash[:errors] = "Please enter valid information for signup. Account not created."
      return redirect_to signup_path 
    end

    redirect_to login_path
  end

  def delete
    #user = set_user
    #user.destroy
    redirect_to welcome_path
  end

  private
  
  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


end