Rails.application.routes.draw do
  authenticated :user, ->(users) { users.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/users'
    get 'admin/items'
  end
  root 'items#index'
  get '/contact', to: 'static#contact'
  get '/about', to: 'static#about'
  get '/profile', to: 'static#profile'
  resources :items
  resources :carts
  resources :cart_items, only: %i[create destroy]
  resources :order_items, only: %i[create destroy]
  devise_for :users
  resources :users, only: %i[show]
  resources :users, only: [:show] do
    resources :profile_pictures, only: [:create]
  end
  post 'checkout/create' => 'checkout#create', as: 'checkout_create'
  resources :webhooks, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
