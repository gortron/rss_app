


    def create
      folder = Folder.find_or_create_by(name: params[:folder][:name], user_id: session[:user_id])
      flash[:errors] = "New Folder #{folder.name} created."
      redirect_to feeds_path
    end

    def edit