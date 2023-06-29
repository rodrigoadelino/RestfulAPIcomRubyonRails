# Criar um link para uma url no caso para o proprio contato em: notebook-api\app\serializers\contact_serializer.rb
link(:self) {contact_path(object.id)}

# Criar um link para a url dos kinds em: notebook-api\app\serializers\contact_serializer.rb
link(:kind) {kind_path(object.kind.id)}

# Criar um link para a url completa para isso precisa ir no arquivo de desenvolvimento ou em produção
# em: notebook-api\config\environments\development.rb Após isso é necessario parar o servidor
Rails.application.routes.default_url_options = {
    host: 'localhost',
    port: 3000
   }


# E em notebook-api\app\serializers\contact_serializer.rb trocar de path para url 
link(:self) {contact_url(object.id)}
link(:kind) {kind_url(object.kind.id)}

# A especificacao propoe a usar os relacionamentos da seguinte forma 
belongs_to :kind  do
link(:kind) {kind_url(object.kind.id)}
end
