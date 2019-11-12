Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'welcome#home', as: :welcome

  get '/signup' => 'users#new'                # sign-up page
  post '/signup' => 'users#create'            # create user > link to session start
  post '/delete_account' => 'users#destroy'   # delete user

  get '/login' => 'sessions#new'              # login page
  post '/login' => 'sessions#login'           # 'CREATE' a session
  post '/logout' => 'sessions#destroy'        # stops session

  get '/dashboard' => 'dashboard#index', as: :dashboard # dashboard_path
  post '/dashboard' => 'dashboard#new_folder_or_feed'

  get '/settings' => 'settings#index'


  
  get '/:username/:folder' => 'users#folder_view', as: :folder # folder_path
  # post '/:username/:folder' => 'users#new_folder'
  get '/:username/:folder/:feed' => 'users#feed_view', as: :feed
  # post '/:username/:folder/:feed' => 'users#new_feed'

  
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
