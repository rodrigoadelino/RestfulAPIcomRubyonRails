## Incluir as associacoes no serializer em : notebook-api\app\serializers\contact_serializer.rb
belongs_to :kind 
has_many :phones  
has_one :address


# Incluir os atributos do kind no serializar em: notebook-api\app\serializers\kind_serializer.rb
class KindSerializer < ActiveModel::Serializer
    attributes :id, :description
end

