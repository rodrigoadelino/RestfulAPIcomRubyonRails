# Incluir o include do Get da controller contact em: notebook-api\app\controllers\contacts_controller.rb
# GET /contacts/1
def show
  render json: @contact, include: [:kind, :phones]
end

# Permitir os numeros de telefones nos parametros
# Only allow a list of trusted parameters through.
def contact_params
  params.require(:contact).permit(
    :name, :email, :birthdate, :kind_id,
    phones_attributes: [:id,:number]
  )
end


# Para mostrar os telefones assim que criar o contato
# POST /contacts
def create
  @contact = Contact.new(contact_params)

  if @contact.save
    render json: @contact, include: [:kind, :phones], status: :created, location: @contact
  else
    render json: @contact.errors, status: :unprocessable_entity
  end
end

# Para mostrar os telefones assim que atualizar o contato
# PATCH/PUT /contacts/1
def update
  if @contact.update(contact_params)
    render json: @contact, include: [:kind, :phones]
  else
    render json: @contact.errors, status: :unprocessable_entity
  end
end



# Criar o POST pelo Postman
{ "contact":
  {
      "name": "Rodrigo Adelino",
      "email": "rodrigoadelino@outlook.com",
      "birthdate": "15/07/1989",
      "kind_id": 2,
      "phones_attributes": [
          {
              "number": "(55) 1199447-8524"
          },
          {
              "number": "(55) 1196303-9023"
          }
      ]
  }
}

# Atualizar um contato (Patch indicar o id que serao atulizado tanto o id do contato quanto os Ids dos telefones
# caso nao passe o id do telefone sera criado um novo numero)
{ "contact":
  {
      "name": "Rodrigo Adelino",
      "email": "rodrigoadelino@outlook.com",
      "birthdate": "15/07/1989",
      "kind_id": 2,
      "phones_attributes": [
          {
              "id": 202,
              "number": "(+55) 1194583-0001"
          },
          {
              "id": 203,
              "number": "(55) 1196303-0002"
          },
          {
              "number": "(55) 1196303-0003"
          }
      ]
  }
}


# Deletar um telefone no contato passando o "_destory" alterar a model contact em: notebook-api\app\models\contact.rb
class Contact < ApplicationRecord
	# Associates
	belongs_to :kind #, optional: true
	has_many :phones  #Possui muitos telefones
	accepts_nested_attributes_for :phones, allow_destroy: true #Atraves de um contato apagar um telefone


# Precisa Liberar o _destroy nos parametros permitidos em: notebook-api\app\controllers\contacts_controller.rb
# Only allow a list of trusted parameters through.
def contact_params
  params.require(:contact).permit(
    :name, :email, :birthdate, :kind_id,
    phones_attributes: [:id, :number, :_destroy]
  )
end


{
  "contact": {
      "name": "Rodrigo Adelino",
      "email": "rodrigoadelino@outlook.com",
      "birthdate": "15/07/1989",
      "kind_id": 2,
      "phones_attributes": [
          {
              "id": 202,
              "_destroy": 1
          },
          {
              "id": 203,
              "_destroy": 1
          },
          {
              "id": 204,
              "_destroy": 1
          },
          {
              "id": 205,
              "number": "(55) 1194583-9744"
          }
      ]
  }
}