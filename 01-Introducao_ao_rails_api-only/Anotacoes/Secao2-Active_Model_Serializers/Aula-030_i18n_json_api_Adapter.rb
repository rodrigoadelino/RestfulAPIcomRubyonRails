## Incluir os atributos em: notebook-api\app\serializers\contact_serializer.rb
class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate
  end
  
# Colocar o I18n em: notebook-api\app\serializers\contact_serializer.rb
def attributes(*args)
    h = super(*args)
    h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h
end

# usar o Json_api como adapter 
#criar o arquivo ams.rb em:config/initializers/ com oconteudo abaixo
ActiveModel::Serializer.config.adapter = :json_api

# Deixando a data com a recomendação de API
def attributes(*args)
    h = super(*args)
    #h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) -PT-BR
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank? # Recomendação de Data em API
    h
end