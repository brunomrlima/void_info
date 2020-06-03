Rails.application.routes.draw do
  get 'subscription_settings/subscribe'
  get 'subscription_settings/unsubscribe'
  patch 'subscription_settings/update'
  root 'emails#index'
  resources :emails, only: [:index, :create]
  namespace "api", module: :api do
    namespace "v1", module: :v1 do
      resources :data_covids, only: [:index]
      resources :countries, only: [:index]
      resources :continents, only: [:index]
    end
  end
end
