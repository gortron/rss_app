class WelcomeController < ApplicationController
  def home
    if session[:username]
      redirect_to dashboard_path(username: session[:username])
    end
  end
end