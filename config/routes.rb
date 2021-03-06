Rails.application.routes.draw do

  post 'favorites/:haiku_id', to: 'favorites#create'
  delete '/favorites/:haiku_id', to: 'favorites#destroy'

  get 'users/show/:id', to: 'users#show', as: 'user'

  post 'likes/:haiku_id', to: 'likes#create', as: 'add_like'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  get '/' => 'apps#index', as: 'root'
  get '/about' => 'apps#about', as:'about'

  get '/haikus/index' => 'haikus#index', as: 'haikus'
  get 'haikus/new' => 'haikus#new', as: 'new_haiku'
  post '/haikus/index' => 'haikus#create'
  # put '/haikus/:id' => 'haikus#update', as:'update_haiku'
  get 'haikus/comparison' => 'haikus#comparison', as: 'comparison'
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
