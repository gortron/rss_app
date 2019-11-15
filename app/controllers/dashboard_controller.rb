class DashboardController < ApplicationController
  before_action :current_user, only: [:index, :folder_view]
  def dashboard_view
    @folders = current_user.folders
    @posts = @user.posts.order('published_time DESC').limit(25)
    if @folders.empty?
      redirect_to add_feed_path
    end
  end

  def folder_view
    @folder = current_user.folders.find_by(name: params[:folder])
    @feeds = @folder.feeds
    @posts = @folder.posts.order('published_time DESC').limit(25)
  end

  def feed_view
    @feed = Feed.find_by(title: params[:feed])
    @posts = @feed.posts.order('published_time DESC').limit(25)
  end

  def refresh
    current_user.folders.each {|folder| folder.refresh_feeds}
    redirect_to dashboard_path
  end

  private

  def folder_params
    params.require(:folder).permit(:name, :user_id)
  end

  def feed_params
    params.require(:feed).permit(:link, :folder_id)
  end

end