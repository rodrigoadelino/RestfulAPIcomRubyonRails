#### Criar o link para phones em: notebook-api\app\serializers\contact_serializer.rb
has_many :phones do
  link(:related) {contact_phones_url(object.id)}
end


### Criar a rota para phones em: notebook-api\config\routes.rb
resource :phones, only: [:show]
resource :phones, only: [:show], path: 'relationships/phones' # aponta para a mesma rota porem com o relationships


### Criar uma controller para phones em notebook-api\app\controllers\phones_controller.rb
class PhonesController < ApplicationController
  before_action :set_phones

  # GET /phones/1
  def show
    render json: @phones
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_phones
    @phones = Contact.find(params[:contact_id]).phones
  end
end
