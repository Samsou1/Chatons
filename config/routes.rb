Rails.application.routes.draw do
  root 'items#index'
  get '/contact', to: 'static#contact'
  get '/about', to: 'static#about'
  resources :items
  resources :carts
  resources :cart_items, only: %i[create destroy]
  resources :order_items, only: %i[create destroy]
  devise_for :users
  post 'checkout/create' => 'checkout#create', as: 'checkout_create'
  resources :webhooks, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
