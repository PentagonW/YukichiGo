Rails.application.routes.draw do
  root to: "home#index"
  resources :monsters
  resources :users, only: [:show]
end
