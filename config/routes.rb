Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "dashboard#show"
  resources :markets, only: [:index]
  resources :tickets, only: [:index, :new, :create, :show, :destroy]
end
