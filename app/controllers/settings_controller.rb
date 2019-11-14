class SettingsController < ApplicationController

    def index
        current_user
        @feeds = @user.feeds
    end


end