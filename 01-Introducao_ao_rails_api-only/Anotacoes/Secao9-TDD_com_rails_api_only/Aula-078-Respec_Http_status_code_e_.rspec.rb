### No arquivo em notebook-api\spec\spec\controllers\v1\contacts_spec.rb usaremos hashes ao inves de codigo
require 'rails_helper'

describe V1::ContactsController, type: :controller do
  it 'request index and return 406 NOT ACCEPTABLE' do
    get :index
    expect(response).to have_http_status(:not_acceptable)
  end

  it 'request index and return 200 OK' do
    request.accept = 'application/vnd.api+json'
    get :index
    expect(response).to have_http_status(:ok)
  end
end



### É possivel configurar para sempre que chamar o rspec ele ja trazer no formato de documentacao
### para isso inclua a linha abaixo em: notebook-api\.rspec
--format documentation
