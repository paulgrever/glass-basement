Rails.application.routes.draw do
  root "regions#index"
  resources :jobs, only: [:index, :show, :create]
  resources :regions, only: [:index]
  resources :companies, only: [:show]
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :chats, only: [:create]
end
