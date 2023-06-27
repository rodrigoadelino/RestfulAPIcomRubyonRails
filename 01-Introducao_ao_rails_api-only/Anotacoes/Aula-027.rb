## CRUD com has_one

##READ
# incluir nas respostas o endereco do contato no show, post e patch em:notebook-api\app\controllers\contacts_controller.rb
# GET /contacts/1
def show
render json: @contact, include: [:kind, :phones, :address]
end

# POST /contacts
def create
@contact = Contact.new(contact_params)

if @contact.save
    render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
else
    render json: @contact.errors, status: :unprocessable_entity
end
end

# PATCH/PUT /contacts/1
def update
if @contact.update(contact_params)
    render json: @contact, include: [:kind, :phones, :address]
else
    render json: @contact.errors, status: :unprocessable_entity
end
end


## CREATE
# Liberar o contact_params para o address em: notebook-api\app\controllers\contacts_controller.rb
def contact_params
params.require(:contact).permit(
    :name, :email, :birthdate, :kind_id,
    phones_attributes: [:id, :number, :_destroy],
    address_attributes: [:id, :street, :city]
)
end

#Incluir o otional na model address em:notebook-api\app\models\contact.rb
class Address < ApplicationRecord
    belongs_to :contact, optional: true
  end

  {
    "contact": {
        "name": "Rodrigo Bonfim",
        "email": "rodrigo@bonfim.test",
        "birthdate": "15/07/1989",
        "kind_id": 2,
        "phones_attributes": [
            {
                "number": "55 11 94583-9744"
            }
        ],
        "address_attributes": {
            "street": "28978 Rodovia Dalila",
            "city": "Frutal"
        }
    }
}


#UPDATE
{
    "contact": {
        "name": "Rodrigo Adelino Bonfim",
        "email": "rodrigo@bonfim.test",
        "birthdate": "15/07/1989",
        "kind_id": 2,
        "phones_attributes": [
            {
                "number": "55 1194583-9744"
            }
        ],
        "address_attributes": {
            "street": "Felippo Cordelli",
            "city": "Sao Paulo"
        }
    }
}


#DELETE NAO FOI USADO NA AULA


#Atualizar o endereço sem cadastra um novo update_only em: 
class Contact < ApplicationRecord
	# Associates
	belongs_to :kind #, optional: true
	has_many :phones  #Possui muitos telefones
	has_one :address


	accepts_nested_attributes_for :phones, allow_destroy: true #Atraves de um contato apagar um telefone
	accepts_nested_attributes_for :address, update_only: true # update_only: true permite atualizar e nao cadastra outro


{
    "contact": {
        "name": "Rodrigo Adelino Bonfim",
        "email": "rodrigo@bonfim.test",
        "birthdate": "15/07/1989",
        "kind_id": 2,
        "phones_attributes": [
            {
                "number": "55 1194583-9744"
            }
        ],
        "address_attributes": {
            "street": "Felippo Cordelli,204",
            "city": "Sao Paulo"
        }
    }
}    