### Versionar nossa API atraves de HTTP


### configurar a header no nosso arquivo de rotas 
api_version(:module => "V1", :header => {:name => "Accept", :value => "application/json; version=1"}) do
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

api_version(:module => "V2", :header => {:name => "Accept", :value => "application/json; version=2"}) do
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


### Dessa forma é possivel para no Header a seguinte configuração
### Realizar os testes no Postman
GET | localhost:3000/contacts



### Utilzar o "X-Version"  aao inves do Accept 
api_version(:module => "V1", :header => {:name => "X-Version", :value => "1.0"}) do
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

api_version(:module => "V2", :header => {:name => "X-Version", :value => "2.0"}) do
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

### Dessa forma é possivel para no Header a seguinte configuração
### Realizar os testes no Postman
GET | localhost:3000/contacts
X-Version 1.0