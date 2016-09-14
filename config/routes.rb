Rails.application.routes.draw do
  resources :items, only: [:index]

  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'

  get '/dashboard', to: 'users#show'

  get "/cart", to: "cart#show"
  post "/cart", to: "cart#create"

  get "/:category_name", to: "categories#show", as: "category"

end
