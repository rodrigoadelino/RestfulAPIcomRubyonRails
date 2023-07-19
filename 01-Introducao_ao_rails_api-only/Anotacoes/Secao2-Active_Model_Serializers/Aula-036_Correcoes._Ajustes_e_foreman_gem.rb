# Correcao para seguir a especificação em: notebook-api\app\serializers\contact_serializer.rb
 belongs_to :kind  do
    link(:related) {kind_url(object.kind.id)}
  end

# Limpar o JSON comentar os links
# URL COMPLETA
# link(:self) {contact_url(object.id)}          
# link(:kind) {kind_url(object.kind.id)}

#Instalar a gem foreman
gem 'foreman'

#criar um arquivo na raiz do projeto como Procfile com o conteudo abaixo 
#web: PORT=3000 rails s
web: bundle exec rails server -p 3000

#Chamar o arquivo foreman
foreman start