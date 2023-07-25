#configurar em 
C:\Windows\System32\drivers\etc\hosts
127.0.0.1			v1.meusite.local
127.0.0.1			v2.meusite.local


### Alterar a routes em notebook-api\config\routes.rb
constraints subdomain: 'v1' do
    scope module: 'v1' do
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
 
  constraints subdomain: 'v2' do
    scope module: 'v2' do
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


### Caso haja problmea com subdominio
# config/environments/development.rb
config.action_dispatch.tld_length = 0