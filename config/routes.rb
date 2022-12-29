Rails.application.routes.draw do
  resources :topics do
    resources :questions, module: :topics do
      resources :answers
    end
  end
  root to: "main#index" 
  get "about", to: "about#index"
  resources :about
  resources :articles
  resources :ulinks
  resources :mylogs
end
