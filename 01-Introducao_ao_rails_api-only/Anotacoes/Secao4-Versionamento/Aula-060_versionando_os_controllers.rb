### Criar duas subpastas(v1, v2) em: notebook-api\app\controllers

### Mover a contacts_controller.rb para a pasta v1 e fazer uma copia para v2 

### Fazer as seguintes modificações em: notebook-api\app\controllers\v1\contacts_controller.rb
module V1
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]

    # GET /contacts
    def index
      @contacts = Contact.all
      render json: @contacts #, methods: [:birthdate_br]
    end


### Fazer as seguintes modificações em: notebook-api\app\controllers\v2\contacts_controller.rb
module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]

    # GET /contacts
    def index
      @contacts = Contact.last(5)

      render json: @contacts #, methods: [:birthdate_br]
    end



### Alteracoes em: notebook-api\config\routes.rb
scope module: 'v1' do
  resources :contacts,:constraints => lambda { |request| request.params[:version] == "1" } do
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

scope module: 'v2' do
  resources :contacts, :constraints => lambda { |request| request.params[:version] == "2" } do
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



### Realizar os testes no Postman
GET | localhost:3000/contacts?version=1
GET | localhost:3000/contacts?version=2