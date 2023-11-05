Rails.application.routes.draw do
  root "welcome#index"

  get "/register", to: "users#registration_form"
  post "/register", to: "users#register"
  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout"
  get "/dashboard", to: "users#show"
  get "/dashboard/search", to: "recipes#index"
  get "/dashboard/search/:recipe_id", to: "recipes#show"
  post "/dashboard/recipes", to: "recipes#create"
  delete "/dashboard/delete_recipe", to: "recipes#destroy"

  # resources :recipes, only: [:index, :show]
end
