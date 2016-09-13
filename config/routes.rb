Rails.application.routes.draw do
  resources :items, only: [:index]

  post "/cart", to: "cart#create", as: "cart"
  
  get "/:category_name", to: "categories#show", as: "category"

end
