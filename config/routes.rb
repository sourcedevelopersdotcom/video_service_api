Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :movies, only: :index
  resources :seasons, only: :index
  resources :contents, only: :index
  resources :purchases, only: :create
  resources :users, only: [] do
    resources :libraries, only: :index
  end
end
