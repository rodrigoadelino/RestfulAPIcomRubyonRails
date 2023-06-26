# Instalar o PRY em desenvolvimento
gem 'pry-rails'

# Atributos aninhados possibilita cadastrad telefones para um contato em: notebook-api\app\models\contact.rb
accepts_nested_attributes_for :phones


# tirar a obrigatoriedade do contact no model phones em: notebook-api\app\models\phone.rb
class Phone < ApplicationRecord
  belongs_to :contact, optional: true
end


# Rails c
# Criar um contato via console
Contact.create(name: "Rodrigo", email: "rodrigo@bonfim.com", birthdate: "15/07/1989", kind_id: 3)
# colocar os dados dentro de um parametro
params = {contact: {name: "Rodrigo", email: "rodrigo@bonfim.com", birthdate: "15/07/1989", kind_id: 3 }}
# Criar o contato com o params
Contact.create(params[:contact])

# Criar os paramatros com os numeros de telefones
params = {contact: {
  name: "Rodrigo", 
  email: "rodrigo@bonfim.com", 
  birthdate: "15/07/1989", 
  kind_id: 3,
  phones_attributes: [
    { number: '1234'},
    { number: '5678'},
    { number: '9012'},
  ]
  }}

# Criar o contato atraves dos params
Contact.create(params[:contact])

# pegar o que foi cadastrado 
Contact.last
Contact.last.phones