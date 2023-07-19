
# Criar o serializer para o phones e address 

# Em: notebook-api\app\serializers\address_serializer.rb
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city
end


# Em: notebook-api\app\serializers\phone.rb
class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number
end


# Inclusao dos serializers na controller em: \app\controllers\contacts_controller.rb
# GET /contacts/1
def show
  render json: @contact, include: [:kind, :phone, :address] #, meta: {author: "Rodrigo Bonfim"} #include: [:kind, :phones, :address]
end