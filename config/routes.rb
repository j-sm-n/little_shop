Rails.application.routes.draw do
  root to: 'homepage#index'

  # resources :items, only: [:index, :show]

  get 'items', to: 'items#index'
  get 'items/:id', to: 'items#show', as: 'item'

  # resources :orders, only: [:create]

  get 'orders', to: 'orders#index'
  post 'orders', to: 'orders#create'
  get 'orders/:id', to: 'orders#show', as: 'order'

  # resources :users, only: [:new, :create, :edit, :update]
  post 'users', to: 'users#create'
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id/edit', to: 'users#edit', as: "edit_user"
  patch 'users/:id', to: 'users#update', as: "user"

  get '/dashboard', to: 'users#show'

  namespace :admin do
    get 'dashboard', to: 'users#show', as: 'dashboard'
    get 'dashboard/edit', to: 'users#edit', as: 'edit_dashboard'
    patch 'dashboard', to: 'users#update'
    patch 'dashboard/orders', to: 'orders#update', as: 'edit_order_status'
    get 'dashboard/items', to: 'items#index', as: 'items'
    get 'dashboard/items/:id/edit', to: 'items#edit', as: 'edit_item'
    patch 'dashboard/items/:id', to: 'items#update', as: 'update_item'
    get 'dashboard/:status', to: 'orders#index', as: 'orders'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get "/cart", to: "cart#show"
  post "/cart", to: "cart#create"
  patch "/cart", to: "cart#update"
  delete "/cart", to: "cart#destroy"


  get "/:category_name", to: "categories#show", as: "category"

end
