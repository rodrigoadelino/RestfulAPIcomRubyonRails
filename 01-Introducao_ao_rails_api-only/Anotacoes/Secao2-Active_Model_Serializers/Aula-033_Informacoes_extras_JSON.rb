## Criar um atributo virtual (Não é o mais recomendado pois nao temos esse atributo na model) em: notebook-api\app\serializers\contact_serializer.rb
class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :author

  def author
    "Rodrigo Bonfim"
  end


## A Especificacao da Json API recomenda usar o nó(tag) meta entao em: notebook-api\app\controllers\contacts_controller.rb
# GET /contacts/1
def show
  render json: @contact, include: [:kind] , meta: {author: "Rodrigo Bonfim"} # Incluido a tag meta
end


# Caso queira utilizar a tag meta para todos os metodos(verbos) chamados no controllers em: notebook-api\app\serializers\contact_serializer.rb
meta do
  { author: "Rodrigo Bonfim"}
end

