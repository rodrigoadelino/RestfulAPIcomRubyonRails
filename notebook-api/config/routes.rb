Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :auths, only: [:create]
  resources :kinds


  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :contacts do 
      resource :kind , only: [:show]
      resource :kind , only: [:show], path: 'relationships/kind' # aponta para a mesma rota porem com o relationships
      
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones' # aponta para a mesma rota porem com o relationships

      #Singular
      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/address' # aponta para a mesma rota porem com o relationships

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address' # aponta para a mesma rota porem com o relationships
    end
  end
  # get '/contacts', to: "contacts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :contacts do
      resource :kind , only: [:show]
      resource :kind , only: [:show], path: 'relationships/kind' # aponta para a mesma rota porem com o relationships
      
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones' # aponta para a mesma rota porem com o relationships

      #Singular
      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/address' # aponta para a mesma rota porem com o relationships

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address' # aponta para a mesma rota porem com o relationships
    end
  end
end
