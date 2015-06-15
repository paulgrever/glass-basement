Rails.application.routes.draw do
  root "regions#index"
  resources :jobs
  resources :regions
  resources :companies
  resources :chats
end
