Rails.application.routes.draw do

  # trips routes
  post 'trips' => 'trips#create'
  # activate and deactivate drivers
  post 'drivers/activate' => 'drivers#activate'
  # get all drivers locations
  get 'drivers/locations' => 'locations#get_drivers_locations'
  # get users location
  get 'passengers/location' => 'locations#get_passenger_location'
  get 'drivers/location' => 'locations#get_driver_location'
  # set users location
  post 'passengers/location' => 'locations#set_passenger_location'
  post 'drivers/location' => 'locations#set_driver_location'

  post 'passengers/stripe' => 'passengers#stripe'

  post '/passengers/login'   => 'passengers#login'

  resources :passengers do
    get '/dashboard' => 'passengers#dashboard'
  end

  post 'drivers/stripe' => 'drivers#stripe'

  post '/drivers/login' => 'drivers#login'

  resources :drivers do
    get '/dashboard' => 'drivers#dashboard'
    delete '/logout' => 'drivers#logout'
  end


  resources :trips do
  end


  resources :vehicles do
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
