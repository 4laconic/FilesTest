Rails.application.routes.draw do

  root 'authentications#welcome'

  post '/signup', to: 'authentications#signup', as: 'signup'
  post '/login', to: 'authentications#login', as: 'login'
  get '/logout', to: 'authentications#logout', as: 'logout'


  get '/files', to: 'containers#index', as: 'files'
  post '/files/upload', to: 'containers#upload', as: 'upload_file'
  delete '/files/delete', to: 'containers#delete', as: 'delete_file'
  get '/uploads/files/:id/:filename', to: 'containers#download', as: 'download_file', 
    :constraints => { :filename => /[-\w+\.]+/ }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
