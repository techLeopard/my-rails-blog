Rails.application.routes.draw do
  resources :topics do
    resources :questions, module: :topics do
        resources :answers, module: :questions
    end
  end
  root to: "main#index" 
  get "stack", to: "stack#index"
  resources :stack
  resources :articles
  resources :ulinks
  resources :mylogs
end
