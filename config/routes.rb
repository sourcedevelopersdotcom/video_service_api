Rails.application.routes.draw do
  resources :movies, only: :index
  resources :seasons, only: :index
end
