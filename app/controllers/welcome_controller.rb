class WelcomeController < ApplicationController
  def home
     if session[:username]
       redirect_to dashboard_path
     end
  end
end