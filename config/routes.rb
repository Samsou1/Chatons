Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/destroy'
  get 'cart_items/create'
  get 'cart_items/destroy'
  root 'items#index'
  resources :items
  resources :carts
  devise_for :users
  post 'checkout/create' => 'checkout#create', as: 'checkout_create'
  resources :webhooks, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
