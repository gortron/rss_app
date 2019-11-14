class FeedsController < ApplicationController

    def new
      current_user
      if @user.folders.size == 0
        flash[:errors] = "Seems like you don't have any folders. Let's set up one now."
      end
    end

    def create_feed
      folder = Folder.find(params[:feed][:folder_id])
      folder.add_feed(params[:feed][:link])
      flash[:errors] = "Feed added to #{folder.name}."
      redirect_to dashboard_path
    end

    def delete_feed
      # delete action
      flash[:errors] = "New Folder #{folder.name} deleted."
      redirect_to feeds_path
    end


    def create_folder
      folder = Folder.find_or_create_by(name: params[:folder][:name], user_id: session[:user_id])
      flash[:errors] = "New Folder #{folder.name} created."
      redirect_to feeds_path
    end

    def edit_folder
      folder = Folder.find_by(id: folder_params[:folder_id])
      folder.update(name: folder_params[:new_name])
      flash[:errors] = "Folder renamed to #{folder_params[:new_name]}."
      redirect_to settings_path 
    end

    def delete_folder
      byebug
      folder = Folder.find(params[:folder_id])
      flash[:errors] = "Folder deleted."
      # delete all subfeeds
      folder.destroy
      
      redirect_to settings_path 
    end

    
    def delete_feed
      # folder = Folder.find_or_create_by(name: params[:folder][:name], user_id: session[:user_id])
      # flash[:errors] = "New Folder #{folder.name} created."
      # redirect_to feeds_path
    end


    private

    def feed_params
      params.require(:feed).permit(:link, :folder_id)
    end

    def folder_params
      byebug
      params.require(:folder).permit(:new_name, :folder_id)
    end
  

end

