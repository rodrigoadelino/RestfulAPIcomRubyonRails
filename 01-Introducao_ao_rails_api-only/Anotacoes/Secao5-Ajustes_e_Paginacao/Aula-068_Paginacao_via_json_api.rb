### Remover a paginacao via header na controller contacts v1
# GET /contacts
def index
  #@contacts = Contact.all.page(params[:page] ? params[:page][:number] : 1 )
  #@contacts = Contact.all.page(params[:page].try(:[], :number)) #Utilizando o Try
  page_number = params[:page].try(:[], :number)
  per_page = params[:page].try(:[], :size)
  @contacts = Contact.all.page(page_number).per(per_page) 
  render json: @contacts
end


### Decodificar uma URL no rails c
URI.decode("http://localhost:3000/v1/contacts?page%5Bnumber%5D=3&page%5Bsize%5D=5")



### Comentar a Gem api-pagination
