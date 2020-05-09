Rails.application.routes.draw do
  get 'subscription_settings/subscribe'
  get 'subscription_settings/unsubscribe'
  patch 'subscription_settings/update'
  root 'emails#index'
  resources :emails, only: [:create]
end
