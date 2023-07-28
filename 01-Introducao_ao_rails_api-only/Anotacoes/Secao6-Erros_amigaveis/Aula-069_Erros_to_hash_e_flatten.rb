### Incluir as validações abaixo em 
class Contact < ApplicationRecord

	#Validations
	validates_presence_of :kind
	validates_presence_of :address



### Teste no rails c do hash
x = Contact.new
x.save
x.errors 
x.errors.to_hash


### Teste no rails c do flatten
x = [1,2,3]
x = [1,2,3, [4,5], [6,7]]
x.flatten 
x = [1,2,3, [4,5], [6,7],[[8, [9,10]]]]
x.flatten 
x.flatten(1)
 