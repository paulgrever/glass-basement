Rails.application.routes.draw do
  root "regions#index"
  resources :jobs
  resources :regions
  resources :companies
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :chats
end
