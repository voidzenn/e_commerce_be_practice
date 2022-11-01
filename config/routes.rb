Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  namespace :admin do
    post "/login", to: "authentication#login"
    delete "/logout", to: "authentication#logout"
    resources :users
  end

  namespace :api do
    namespace :v1 do
      post "/signin", to: "authentication#login"
      post "/signup", to: "authentication#register"
      resources :users
    end
  end
end
