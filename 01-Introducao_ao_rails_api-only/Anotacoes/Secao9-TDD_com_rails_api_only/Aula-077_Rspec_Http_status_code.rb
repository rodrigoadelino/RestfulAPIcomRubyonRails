### Apagar o banco teste.sqlite3 em notebook-api\db\test.sqlite3



### Corrigir a estrutura de pastas
notebook-api\spec\controllers\v1
notebook-api\spec\controllers\v2


### No arquivo em notebook-api\spec\spec\controllers\v1\contacts_spec.rb
require 'rails_helper'

describe V1::ContactsController, type: :controller do
  # it 'request index and return 200 OK' do
  #   request.accept = 'application/json'
  #   get :index 
  #   expect(response.status).to eql(200)
  # end  
  it 'request index and return 406' do
    get :index 
    expect(response.status).to have_http_status(406)
  end  


  it 'request index and return 200 OK' do
    request.accept = 'application/json'
    get :index 
    expect(response.status).to have_http_status(200)
  end  
end


### Testar o Rspec 
bundle exec rspec -h   # Para visulaizar as opcoes do comando 
bundle exec rspec --format d # Para visulizaçao melhor 



