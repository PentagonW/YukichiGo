Rails.application.routes.draw do
  root to: "monsters#new"
  resources :monsters
end
