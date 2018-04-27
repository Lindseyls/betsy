Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'mains#index'

  post '/logout', to: 'sessions#logout', as: 'logout'
  resources :order_items

  resources :mains, only: [:index]

  resources :categories, only: [:index, :new, :create] do
    resources :products, only: [:index]
  end

  resources :users do
    resources :products, only: [:index]
  end

  resources :orders

  resources :products do
    resources :reviews, only: [:new, :create]
  end


  get '/make_cart', to: 'orders#make_cart', as: 'cart'

  get "/auth/:provider/callback", to: "sessions#create", as: "auth_callback"

end
