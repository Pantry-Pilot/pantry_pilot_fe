Rails.application.routes.draw do
  root "welcome#index"

  get "/register", to: "users#registration_form"
  post "/register", to: "users#register"
  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  get "/dashboard", to: "users#show"

  resources :recipes, only: [:index, :show]
end
