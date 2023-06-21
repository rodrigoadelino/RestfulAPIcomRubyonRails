namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os tipos de contatos"
      kinds = %w(amigo comercial conhecido) # com o %w não é necessario inserir a virgula 
      kinds.each do |kind|  
      Kind.create!(
        description: kind
      )
      end
    puts "Tipos de Contatos cadastrados com sucesso"
  end 
  #################################################
  
  task setup: :environment do
    puts "Cadastrando os contatos"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from:65.years.ago, to:18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso"
  end
end
