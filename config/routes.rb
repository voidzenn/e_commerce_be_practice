Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'authentication#index'
  
  namespace :admin do
    get '/users', to: 'admin_controller'
  end

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
 
  post '/auth/login', to: 'authentication#login'
  get  '*unmatched_route', to: 'application#not_found'
end
