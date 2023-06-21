# Criar um contato passando os apenas os dados abaixo: 
{
    "name": "Rodrigo Adelino",
    "email": "rodrigo@adelino.example",
    "birthdate": "1989-07-15"
}
# Retorno
{
    "kind": [
        "must exist"
    ]
}

# Por padrao o Rails traz o belongs_to como obrigatorio em: notebook-api\app\models\contact.rb
class Contact < ApplicationRecord
	belongs_to :kind
end

# Para deixar o belongs_to como opcional deve alterar da seguinte forma:
# No meu caso tive que altera o tipo da coluna criando uma nova migracao
# rodei o comando abaixo 
rails g migration change_column_null :contacts, :kind_id, true
#Depois alaterei a migracao para ficar assim:
class ChangeColumnNull < ActiveRecord::Migration[6.1]
	def change
	  change_column_null :contacts, :kind_id, true
	end
  end  
# E depois alterar em notebook-api\app\models\contact.rb
class Contact < ApplicationRecord
	belongs_to :kind, optional: true
end


# Para cadastrar um contato com o kind_id deve incluir o mesmo no contact_params em notebook-api\app\controllers\contacts_controller.rb

private
# Use callbacks to share common setup or constraints between actions.
def set_contact
  @contact = Contact.find(params[:id])
end

# Only allow a list of trusted parameters through.
def contact_params
  params.require(:contact).permit(:name, :email, :birthdate, :kind_id) # Inclusao do kind_id
end
end
