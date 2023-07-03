Rails.application.routes.draw do
  resources :kinds
  
  resources :contacts do
    resource:kind , only: [:show]
    resource:kind , only: [:show], path: 'relationships/kind' # aponta para a mesma rota porem com o relationships
  end
  # get '/contacts', to: "contacts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
