Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "articles#index" 
  get "about", to: "about#index"

  resources :articles
  resources :ulinks

end