## Criar um serilaizer em notebook-api\app\serializers\error_serializer.rb
module ErrorSerializer
    def self.serialize(errors)
      return if errors.nil?
        json = {}
          new_hash = errors.to_hash.map do |k, v|
            v.map do |msg|
              { id: k, title: msg }
          end
        end.flatten
      json[:errors] = new_hash
      json
    end
  end

  
### Em notebook-api\app\serializers\v1\contact_serializer.rb
include ErrorSerializer
# Substituir a linha:
render json: @contact.errors, status: :unprocessable_entity
# pela linha abaixo:
render json: ErrorSerializer.serialize(@contact.errors)