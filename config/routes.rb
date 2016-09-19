Rails.application.routes.draw do
  root to: 'homepage#index'

  resources :items, only: [:index, :show]

  resources :orders, only: [:index, :show, :create]

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  namespace :admin do
    get 'dashboard', to: 'users#show', as: 'dashboard'
    get 'dashboard/edit', to: 'users#edit', as: 'edit_dashboard'
    patch 'dashboard', to: 'users#update'
    get 'dashboard/:status', to: 'orders#index', as: 'orders'
    patch 'dashboard/orders', to: 'orders#update', as: 'edit_order_status'
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
