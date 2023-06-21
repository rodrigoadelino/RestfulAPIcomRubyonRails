# Criar um arquivo locale.rb em: notebook-api\config\initializers como oconteudo abaixo
#config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
I18n.default_locale = :'pt-BR'

# Instalar a gem rails-i18n 
gem 'rails-i18n', '~>5.0.0'

# criar o arquivo pt-BR.yml em notebook-api\config\locales com o conteudo abaixo:
'pt-BR':
  hello: "Olá Mundo!"

# Testar a tradução no rails c
I18n.translate('hello') # Devera trazer => "Olá Mundo!"

#Verificar qual a configuracao  do I18n no rails c
I18n.default_locale # => :"pt-BR"

# alterar a configuracao  do I18n no rails c
I18n.default_locale = :en

# Se pedir a tradução com o idioma :en
I18n.translate('hello') # deverá vir => "Hello world"
I18n.t('hello') # deverá vir => "Hello world"

# Verificar a data atual no rails c com o idioma :en
Date.today #=> Wed, 21 Jun 2023

# Pedir para trazer a data no formato pt-BT
I18n.default_locale = "pt-BR"
I18n.l(Date.today)

# Criação de dois methods para teste em notebook-api\app\models\contact.rb
def hello
  I18n.t('hello')
end
def i18n
  I18n.default_locale
end

#chamada dos methods em notebook-api\app\controllers\contacts_controller.rb
  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts, methods: [:hello, :i18n] # Aqui
  end 