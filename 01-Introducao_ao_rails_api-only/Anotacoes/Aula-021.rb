# Criar a migracao e o modelo
rails g model Phone number:string contact:references

# colocar a assosciacao has many (um contato pode ter muitos telefones) em: notebook-api\app\models\contact.rb
class Contact < ApplicationRecord
	# Associates
	belongs_to :kind #, optional: true
	has_many :phones


# Criar uma task para cadastrar os telefones em: notebook-api\lib\tasks\dev.rake
puts "Cadastrando os telefones..."

Contact.all.each do |contact|
  Random.rand(5).times do |i|
    phone = Phone.create!(number:Faker::PhoneNumber.cell_phone, contact: contact)
    contact.phones << phone
    contact.save!
  end
end
puts "Telefones cadastrados com sucesso"
end 

# Rodar o comando abaixo 
rails db:drop:_unsafe db:create db:migrate dev:setup


# Testar no rails c
c = Contact.last
c.phones
c.phones.count
