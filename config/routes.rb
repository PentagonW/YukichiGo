Rails.application.routes.draw do
  root to: "home#index"
  resources :monsters do
    collection do
      get 'complete'
      get 'failure'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resources :battles, only: [:index, :new]
    resources :transfers, only: [:new, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :main_monsters, only: :create
    end
  end
end
