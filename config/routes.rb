Rails.application.routes.draw do
  devise_for :users

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  root "home#index"

  resources :telegram_groups

  namespace :webhooks do 
    post "slack/endpoint", to: "slack#endpoint"
    post "telegram/endpoint", to: "telegram#endpoint"
  end
end
