Rails.application.routes.draw do
  resources :kinds
  
  resources :contacts do
    resource :kind , only: [:show]
    resource :kind , only: [:show], path: 'relationships/kind' # aponta para a mesma rota porem com o relationships
    
    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones' # aponta para a mesma rota porem com o relationships

    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address' # aponta para a mesma rota porem com o relationships
    end
  # get '/contacts', to: "contacts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
