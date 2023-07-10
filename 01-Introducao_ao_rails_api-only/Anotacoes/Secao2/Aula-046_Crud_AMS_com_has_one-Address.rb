#### Incluir o update na rota do Address em: notebook-api\config\routes.rb
resource :address, only: [:show, :update]
resource :address, only: [:show, :update], path: 'relationships/address'


#### Criar a action Update em:notebook-api\app\controllers\addresses_controller.rb
class AddressesController < ApplicationController
    before_action :set_contact
  
    # PATCH /contacts/1/address
    def update
        if @contact.address.update(address_params)
        render json: @contact.address
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end
  
    # GET /contacts/1/address
    def show
      render json: @contact.address
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:contact_id])
    end
  
    def address_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
  end


### TESTE COM PATCH
#PATCH http://localhost:3000/contacts/100/address
{
    "data": {
        "id": "100",
        "type": "addresses",
        "attributes": {
            "street": "123 Avenida Carlos",
            "city": "Quintana 123"
        }
    }
}


### Liberar a rota de post em: notebook-api\config\routes.rb
resource :address, only: [:show, :update, :create]
resource :address, only: [:show, :update, :create], path: 'relationships/address'


### Criar a action Post em:notebook-api\app\controllers\addresses_controller.rb
# POST /contacts/1/address
def create
  @contact.address = Address.new(address_params)
  if @contact.save
    render json: @contact.address, status: :created, location: contact_address_url(@contact)
  else
    render json: @contact.errors, status: :unprocessable_entity
  end
end


### TESTE COM POST
#POST http://localhost:3000/contacts/102/address
{
    "data": {
        "type": "addresses",
        "attributes": {
            "street": "Felippo Cordelli 204",
            "city": "Quintana 1234"
        }
    }
}

### Liberar a rota de delete em: notebook-api\config\routes.rb
resource :address, only: [:show, :update, :create, :destroy]
resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address' 



### Criar a action Delete em:notebook-api\app\controllers\addresses_controller.rb
# DELETE /contacts/1/address
def destroy
    @contact.address.destroy
  end

### TESTE COM DELETE
#DELETE http://localhost:3000/contacts/102/address
{
    "data": {
        "type": "addresses",
        "attributes": {
            "street": "Felippo Cordelli 204",
            "city": "Quintana 1234"
        }
    }
}

### Tazer o relacionemanto com o contato no get em notebook-api\app\serializers\address_serializer.rb
class AddressSerializer < ActiveModel::Serializer
    attributes :id, :street, :city
  
    belongs_to :contact  do
      link(:related) {contact_address_url(object.contact.id)}
    end
  end