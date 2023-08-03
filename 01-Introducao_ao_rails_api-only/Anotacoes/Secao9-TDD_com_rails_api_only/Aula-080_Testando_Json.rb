### Remover a validação de obrigatoriedade do addrress na model contact em notebook-api\app\models\contact.rb
validates_presence_of :address


### Popular o ambiente de teste
rails db:migrate RAILS_ENV=test
rails dev:setup RAILS_ENV=test



### Configurar o localhost no ambiente de teste em: notebook-api\config\environments\test.rb
Rails.application.routes.default_url_options = {
    host: 'localhost',
    port: 3000
   }



### Remover o include em: notebook-api\app\controllers\v1\contacts_controller.rb
# GET /contacts/1
def show
    render json: @contact #, include: [:kind, :phones, :address] #, meta: {author: "Rodrigo Bonfim"} #include: [:kind, :phones, :address]
    end


### Criar mais uma especificação em notebook-api\spec\spec\controllers\v1\contacts_spec.rb

