class DashboardController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    #feeds for dashboard
  end

#   def folder_view
#     @folder = current_user.folders.find_by(name: params[:folder])
#     #byebug
#   end

#   def feed_view
#     # @folder = params[:folder]
#     # @feed = params[:feed]
#   end



  def new_folder_or_feed
    byebug
    folder = Folder.find_or_create_by(name: params[:folder][:name], user_id: session[:user_id])
    feed = Feed.create_from_url({"link" => params[:feed][:link], "folder_id" => folder.id})
    #Feed.create_from_url(feed_params)
    redirect_to dashboard_path
  end

  def folder_params
    params.require(:folder).permit(:name, :user_id)
  end

  def feed_params
    params.require(:feed).permit(:link, :folder_id)
  end

end