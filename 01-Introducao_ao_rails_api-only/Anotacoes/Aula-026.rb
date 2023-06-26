# Rails Console com has-one

# Rails c 
# Criando um contato
contact = Contact.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
  kind: Kind.all.sample
)

# Criando um endereço
Address.create!(
  street: Faker::Address.street_address,
  city:Faker::Address::city, 
  contact: contact 
)

# É possivel criar varios endrecos no banco de dados para um contato porem quando buscamo o endreco no contato ele traz somente o ultimo 
contact.address

# pegar todos os endereços cadastrados
Address.where(contact_id:101)
