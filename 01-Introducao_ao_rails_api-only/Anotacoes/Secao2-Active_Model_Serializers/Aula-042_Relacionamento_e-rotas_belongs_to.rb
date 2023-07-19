#### Crinado a rota em: notebook-api\config\routes.rb
Rails.application.routes.draw do
  resources :kinds
  
  resources :contacts
    resource:kind , only[:show]
  end

end


#### Alterando no serializer em: notebook-api\app\serializers\contact_serializer.rb
class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate 

  #Associates
  belongs_to :kind  do
    link(:related) {contact_kind_url(object.id)}
  end
  has_many :phones  
  has_one :address



#### Corrigindo o link em: notebook-api\app\controllers\kinds_controller.rb
private
# Use callbacks to share common setup or constraints between actions.
def set_kind
  if params[:contact_id]
    kind_id = Contact.find(params[:contact_id])
  else 
    kind_id = Kind.find(params[:id])
  end
  
  @kind = Kind.find(kind_id.id)
end


### Colocando o relationships na rota em: notebook-api\config\routes.rb
Rails.application.routes.draw do
  resources :kinds
  
  resources :contacts do
    resource:kind , only: [:show]
    resource:kind , only: [:show], path: 'relationships/kind' # aponta para a mesma rota porem com o relationships
  end
  # get '/contacts', to: "contacts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


### Refatorando a pesquisa do kind em: notebook-api\app\controllers\kinds_controller.rb
def set_kind
  if params[:contact_id]
    @kind = Contact.find(params[:contact_id]).kind
    return @kind
  end
    @kind = Kind.find(params[:id])
end