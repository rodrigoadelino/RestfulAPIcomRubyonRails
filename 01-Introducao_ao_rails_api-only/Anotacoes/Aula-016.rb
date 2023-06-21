## Novo CRUD
# Incluir a coluna kind(tipo) na tabela contacts que será referencia para a tabela Kind
rails g scaffold Kind description:string


## gerando o scanfolld da Kind
rails g migration add_kind_to_contact kind:references


## Fazer a associacao (kind pertence a contacts) em 
class Contact < ApplicationRecord
	belongs_to :kind # Inclusao dessa linha

	def author
		"Rodrigo Adelino"
	end

	def as_json(options={})
		super(methods: :author, root: true)
	end
end


## Criar uma task para a Kind em: notebook-api\lib\tasks\dev.rake
task setup: :environment do
  puts "Cadastrando os tipos de contatos"
    kinds = %w(amigo comercial conhecido) # com o %w não é necessario inserir a virgula 
    kids.each do |kide|  
    Kind.create!(
      description: kind
    )
    end
  puts "Tipos de Contatos cadastrados com sucesso"
end 


## Ajustando a Task para preencher o kind na tabela Contacts em: notebook-api\lib\tasks\dev.rake
task setup: :environment do
  puts "Cadastrando os contatos"
  100.times do |i|
    Contact.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      birthdate: Faker::Date.between(from:65.years.ago, to:18.years.ago),
      kind: Kind.all.sample # Inclusao dessa linha
    )
  end
  puts "Contatos cadastrados com sucesso"
end
end


## realizar o teste das alaterações 
rails db:drop:_unsafe db:create db:migrate dev:setup
