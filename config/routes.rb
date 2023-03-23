Rails.application.routes.draw do
  devise_for :users
  
  root "home#index"

  namespace :webhooks do 
    post "slack/endpoint", to: "slack#endpoint"
  end
end
