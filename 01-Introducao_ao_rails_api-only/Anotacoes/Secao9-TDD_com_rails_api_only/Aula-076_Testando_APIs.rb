## Instalar a gem rsperc
gem 'rspec-rails', '~> 3.5'  #Utilizado no curso 
gem 'rspec-rails'   #usei assim


### Criar alguns arquivos do Rspec
rails generate rspec:install



### Comnado para rodar os teste
bundle exec rspec


### Criar a estrutura de pasta
notebook-api\spec\spec\controllers\v1
notebook-api\spec\spec\controllers\v2


### Criar o arquivo em notebook-api\spec\spec\controllers\v1\contacts_spec.rb (todo arquivo _spec sera visto pelo rspec)