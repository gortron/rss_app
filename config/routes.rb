Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'welcome#home', as: :welcome
  get '/settings' => 'users#settings', as: :settings

  get '/signup' => 'users#signup'                # sign-up page
  post '/signup' => 'users#create'            # create user > link to session start
  delete '/delete' => 'users#delete'          # delete user
  post '/update' => 'users#update'            # update user details
  post '/update_pw' => 'users#update_pw'            # update user details

  get '/login' => 'sessions#login'   # login page
  post '/login' => 'sessions#create'           # 'CREATE' a session
  post '/logout' => 'sessions#destroy'        # stops session

  get '/add_feed' => 'subscription#new'                     # new feed form
  post '/new_feed' => 'subscription#create_feed'        # add new feed to database
  post '/edit_feed' => 'subscription#edit_feed'        # add new feed to database
  
  post '/new_folder' => 'subscription#create_folder'       # add new folder to database
  post '/edit_folder' => 'subscription#edit_folder'        # edit folder
  delete '/delete_folder' => 'subscription#delete_folder', as: :delete_folder # add new feed to database

  get '/dashboard' => 'dashboard#dashboard_view', as: :dashboard # dashboard_path
  
  # post '/dashboard' => 'dashboard#new_folder_or_feed'
  post '/dashboard/refresh' => 'dashboard#refresh', as: :refresh
  get '/:username/:folder' => 'dashboard#folder_view', as: :folder
  get '/:feed' => 'dashboard#feed_view', as: :feed



  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
