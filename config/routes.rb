Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'authentication#index'
  
  namespace :admin do
    get ''
  end

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
 
  post '/auth/login', to: 'authentication#login'
  get  '/a*', to: 'application#not_found'
end
