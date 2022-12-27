Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "main#index" 
  get "about", to: "about#index"
  resources :about
  resources :articles
  resources :ulinks
  resources :mylogs
  resources :topics do
    resources :question_items do
      resources :answers
    end
  end
  
end
