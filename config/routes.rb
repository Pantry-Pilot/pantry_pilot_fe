Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"

  get "/register", to: "users#registration_form"
  post "/register", to: "users#register"
  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
end
