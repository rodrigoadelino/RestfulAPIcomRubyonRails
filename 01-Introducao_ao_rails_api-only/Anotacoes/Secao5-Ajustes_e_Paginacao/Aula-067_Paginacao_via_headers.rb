### Paginação via Headers
# Instalar a gem Kaminari
gem 'kaminari'


### Incluir a paginacao na controller contacts v1
# GET /contacts
def index
  @contacts = Contact.all.page((params[:page])).per(5)  ##Incluido a paginação ##per(5)mostra somente 5 elementos
  render json: @contacts #, methods: [:birthdate_br]
end

# Instalar a gem api-paginations
gem 'api-paginations'


### Deve alterar o render para paginate na controller contacts v1
# GET /contacts
def index
  @contacts = Contact.all.page((params[:page])).per(5)
  paginate json: @contacts #, methods: [:birthdate_br]
end


### Devido a alguma incompatibilidade da kaminari com o paginate removeremos a .per 5 em 
# GET /contacts
def index
  @contacts = Contact.all.page((params[:page]))
  render json: @contacts #, methods: [:birthdate_br]
end



### Forçar o numeo de item na model Contacts
class Contact < ApplicationRecord

	#Kaminari
	paginates_per 5



### As intrucoes das paginas pode ser visto no Headers de retorno