Rails.application.routes.draw do
  root "regions#index"
  resources :jobs
  resources :regions
  resources :companies
  get "/auth/github_oauth/callback", to: 'sessions#create'
end
