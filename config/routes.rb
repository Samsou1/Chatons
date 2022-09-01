Rails.application.routes.draw do
  root 'items#index'
  get '/contact', to: 'static#contact'
  get '/about', to: 'static#about'
  get '/profile', to: 'static#profile'
  get '/cart', to: 'static#cart'
  resources :items
  resources :items, only: [:show] do
    resources :images, only: [:create]
  end
  resources :carts
  resources :orders, only: %i[create]
  resources :cart_items, only: %i[create destroy]
  resources :order_items, only: %i[create destroy]
  devise_for :users
  resources :users, only: [:show]
  resources :users, only: [:show] do
    resources :profile_pictures, only: [:create]
    resources :orders, only: %i[show index]
  end
  post 'checkouts/create' => 'checkouts#create', as: 'checkouts_create'
  resources :webhooks, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
