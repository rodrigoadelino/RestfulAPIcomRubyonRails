### Instalar a gem abaixo (Essa versao funcina no Rails 6 a da aula não funciona)
gem 'versionist', '~> 1.5.0'



### configurar em notebook-api\config\routes.rb
api_version(:module => "V1", :parameter => {:name => "version", :value => "1"}) do
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
api_version(:module => "V2", :parameter => {:name => "version", :value => "2"}) do
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


### Mover a address_controller.rb, kinds_controller.rb e phones_controller.rb de notebook-api\app\controllers 
### para notebook-api\app\controllers\v1 e notebook-api\app\controllers\v2


#### Incluir nos arquivos address_controller.rb, kinds_controller.rb e phones_controller.rb
#### notebook-api\app\controllers\v1 e notebook-api\app\controllers\v2 
# na primeira linha:
Module V1
# na ultima linha:
end


### Realizar os testes do Postman
localhost:3000/contacts/90/phones?version=1