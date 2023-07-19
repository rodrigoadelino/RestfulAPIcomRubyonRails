# em: notebook-api\app\serializers\contact_serializer.rb

def contact_params
    # params.require(:contact).permit(
    #   :name, :email, :birthdate, :kind_id,
    #   phones_attributes: [:id, :number, :_destroy],
    #   address_attributes: [:id, :street, :city]
    # )
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
end