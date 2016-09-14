Rails.application.routes.draw do

  resources :items, only: [:index, :show]

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get "/cart", to: "cart#show"
  post "/cart", to: "cart#create"
  patch "/cart", to: "cart#update"
  delete "/cart", to: "cart#destroy"

  get "/:category_name", to: "categories#show", as: "category"

end
