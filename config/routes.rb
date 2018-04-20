Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'products#index'

  resources :products do
    # non-RESTful routes can be specified in a block or you manually:
    # get '/products/:id', to: 'products#index', as: 'products'
  end

  get "/auth/:provider/callback", to: "sessions#create" :as "auth_callback"

end
