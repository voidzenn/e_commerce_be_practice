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
      post "/signin", to: "authentication#signin"
      post "/signup", to: "authentication#signup"
      resources :users
      resources :items
      resources :orders
    end
  end
end
