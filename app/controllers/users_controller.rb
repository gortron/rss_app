class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create # this is our 'CREATE'
    @user = User.create(user_params)
    unless @user.save
      flash[:errors] = @user.errors.full_messages.to_sentence
      return render :new
    end
    flash[:errors] = "Account created! Please re-enter your credentials. No 🤖s allowed."
    redirect_to login_path
  end

  def update_pw #post route form change form
    @user = current_user
    @user = @user.try(:authenticate, params[:user][:old_password])

    unless @user
       flash[:errors] = "Incorrect Password: Please reenter your old password."
       return redirect_to settings_path
    end

    unless  params[:user][:password] == params[:user][:password_confirmation]
      flash[:errors] = "Password and Confirmation don't match."
      return redirect_to settings_path
    end

    @user.update(user_params)
    redirect_to settings_path #maybe to somewhere else
  end

  def update #post route form change form
    @user = current_user
    @user = @user.try(:authenticate, params[:user][:password])
    unless @user
       flash[:errors] = "Incorrect Password: Please reenter your password."
       return redirect_to settings_path
    end

    @user.update(user_params)
  
    redirect_to settings_path #maybe to somewhere else
  end

  def delete
    current_user

    @user = @user.try(:authenticate, params[:user][:password])
    unless @user
       flash[:errors] = "Incorrect Password: Please reenter your password."
       return redirect_to settings_path
    end
  
    @user.folders.each do |folder|
      folder.folder_feeds.destroy_all
      folder.destroy
    end
    
    @user.destroy
    
    flash[:errors] = "Account deleted."
    reset_session
    redirect_to welcome_path
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end

  def password_update_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end