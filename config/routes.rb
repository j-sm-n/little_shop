Rails.application.routes.draw do
  resources :items, only: [:index]

  get "/cart", to: "cart#show"
  post "/cart", to: "cart#create"

  get "/:category_name", to: "categories#show", as: "category"

end
