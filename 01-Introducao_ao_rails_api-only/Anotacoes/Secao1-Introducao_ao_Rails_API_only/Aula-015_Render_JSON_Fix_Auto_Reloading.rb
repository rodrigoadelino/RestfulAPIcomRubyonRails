## Fix Auto_Reloading
#Incluir a linha no arquivo: notebook-api\config\environments\development.rb
config.file_watcher = ActiveSupport::FileUpdateChecker


## elemento rails notebook-api\app\controllers\contacts_controller.rb
  def index
    @contacts = Contact.all

    render json: @contacts, root: true
  end


## Somente os elementos escolhidos notebook-api\app\controllers\contacts_controller.rb
def index
    @contacts = Contact.all

    render json: @contacts, only: [:name, :email]
  end

## remove os elementos escolhidos notebook-api\app\controllers\contacts_controller.rb
def index
    @contacts = Contact.all

    render json: @contacts, except: [:name, :email]
  end

## colocar um novo atributo para todos os contatos
def index
    @contacts = Contact.all

    render json: @contacts.map {|contact| contact.attributes.merge({author: "Rodrigo"})}
  end

## colocar um novo atributo para apenas um contato (show)
def show
    render json: @contact.attributes.merge({author: "Rodrigo"})
  end
  

 ## Utilizando Metodos
def index
    @contacts = Contact.all
    render json: @contacts, methods: :author
end

## Para utilizar o method author é necessario declarar ele na model contacts: notebook-api\app\models\contact.rb 
class Contact < ApplicationRecord
    def author
        "Rodrigo Adelino"
    end
end

## As json juntar todas essas alteracoes apenas em um lugar e para todos os verbos
## Para isso é necessario definir o metodo as_json na model contacts: notebook-api\app\models\contact.rb 
def as_json(options={})
    super(methods: :author, root: true)
end
