Rails.application.routes.draw do
  root to: "home#index"
  resources :monsters
  resources :battles, only: :index
  resources :users, only: [:show]
end
