Rails.application.routes.draw do

  root 'home#show'

  resources :users, only: [:new, :create]

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :links
  resources :recommendations, only: [:new, :create]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end