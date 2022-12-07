Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "dashboard#show"
  get "home", to: "pages#home"
  get "tuto1", to: "pages#tuto1"
  get "tuto2", to: "pages#tuto2"
  get "tuto3", to: "pages#tuto3"
  resources :markets, only: [:index]
  resources :tickets, only: [:index, :new, :create, :show, :destroy]
end
