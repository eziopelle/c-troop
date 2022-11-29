Rails.application.routes.draw do
  get 'market_products/update'
  get 'market_products/edit'
  get 'tickets/index'
  get 'tickets/new'
  get 'tickets/create'
  get 'tickets/destroy'
  get 'markets/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :markets, only: [:index] do
    resources :tickets, only: [:index, :new, :create, :show]
  end
  resources :tickets, only: [:destroy]
end
