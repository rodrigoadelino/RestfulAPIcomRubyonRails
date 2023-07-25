### Alterar a routes em notebook-api\config\routes.rb
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



### Criar duas subpastas(v1, v2) em: notebook-api\app\serializers
# nas pastas copiar o arquivo para as 2 pastas V1 e v2 notebook-api\app\serializers\contact_serializer.rb

#incluir na primeira linha de cada arquivo confomr a versao 
module V1
# e na ultima 
end

# Lterar 
belongs_to :kind  do
  link(:related) {v1_contact_kind_url(object.id)} # A rota foi alterada deve-se colocar v1_
end
has_many :phones do
  link(:related) {v1_contact_phones_url(object.id)}
end
has_one :address do
  link(:related) {v1_contact_address_url(object.id)}    # URL para mostrar o link completo
end 


