#### Criar o link para address em: notebook-api\app\serializers\contact_serializer.rb
has_one :address do
  link(:related) {contact_address_url(object.id)}    # URL para mostrar o link completo
end 


### Criar a rota para address em: notebook-api\config\routes.rb
resource :address, only: [:show]
resource :address, only: [:show], path: 'relationships/address' # aponta para a mesma rota porem com o relationships


### Criar uma controller para address em notebook-api\app\controllers\addresses_controller.rb ### Controller deve ser no plural
class AddressesController < ApplicationController
  before_action :set_address

  # GET /address/1
  def show
    render json: @address
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Contact.find(params[:contact_id]).address
  end
end
