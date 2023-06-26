# Novo model Address (Associação has_one)
rails g model Address street:string city:string contact:references


# Incluir a associacao no model contact em: notebook-api\app\models\contact.rb
has_one :address
# E tambem deixar ativo o nested_attributes
accepts_nested_attributes_for :address

class Contact < ApplicationRecord
# Associates
belongs_to :kind #, optional: true
has_many :phones  #Possui muitos telefones
has_one :address

accepts_nested_attributes_for :phones, allow_destroy: true #Atraves de um contato apagar um telefone
accepts_nested_attributes_for :address


# Criar a task para incluir os endereços em: notebook-api\lib\tasks\dev.rake
# O Comando abaixo executa no terminal tudo que estiver entre os parenteses
%x( )
# ALterações na dev rake
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Resetando o banco d edados..."
    %x(rails db:drop:_unsafe db:create db:migrate )
    ....
    ....
puts "Cadastrando os Enderecos..."

Contact.all.each do |contact|
  address = Address.create!(
    street: Faker::Address.street_address,
    city:Faker::Address::city 
    contact: contact 
  )
end
puts "Endereços cadastrados com sucesso"
