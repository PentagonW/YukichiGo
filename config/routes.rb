Rails.application.routes.draw do
  root to: "home#index"
  resources :monsters
  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :main_monsters, only: :create
    end
  end
end
