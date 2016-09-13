Rails.application.routes.draw do
  resources :items, only: [:index]

  # post 
  get "/:category_name", to: "categories#show", as: "category"

end
