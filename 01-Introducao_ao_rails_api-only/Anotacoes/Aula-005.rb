# Criado o primeiro CRUD/Scanffold
rails g scaffold Contact name:string email:string birthdate:date

# Migrar a tabela criada
rails db:migrate

# Usar a gem 
gem 'faker'

# Criar uma Task em "notebook-api\lib\tasks\dev.rake"
rails g task dev setup #cria a task dev com a opcao setup 

# Alterar a task
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from:65.years.ago, to:18.years.ago)
      )
    end
    puts "Contatos cadastrados com sucesso"
  end
end

  

# Visualizar as Tasks
rails -T dev #(dev no final filtra pelo tipo das tasks)

#Rodar a task
rails dev:setup