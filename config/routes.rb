Rails.application.routes.draw do
  devise_for :users
  root to: "markets#index"
  get "dashboard", to: "dashboard#show"
  get "home", to: "pages#home"
  get "tuto1", to: "pages#tuto1"
  resources :markets, only: [:index]
  resources :tickets, only: [:index, :new, :create, :show, :destroy]
end
