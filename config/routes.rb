Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get 'posts/index'
      # get 'posts/show'
      # get 'posts/create'
      # get 'posts/update'
      # get 'posts/destroy'
      resources: posts, only: [:index, :show, :create, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # get "reg", to: "reg#signup"
  

#####################################################

  # Home Page
  # get "/", to: "main#index"
  root to: "main#index"

  # About Page
  get "about", to: "about#about"
  
  # SignUp Page
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  
  # Logout Page
  delete "logout", to: "sessions#destroy"

  # Login Page
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

end
