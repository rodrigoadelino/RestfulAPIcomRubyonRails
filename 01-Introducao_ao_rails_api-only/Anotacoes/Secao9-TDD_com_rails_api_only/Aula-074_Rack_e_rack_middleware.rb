## ver os middleware que estão executaando na aplicação
rails middleware


## Criar um rack simples em: notebook-api\lib\my_rack.rb
require 'rack'

app = Proc.new do |env|
    ['200', {'Content-Type' =>'text/html'}, ["#{env}"]]
end

Rack::Handler::WEBrick.run(app, Port: 3000, Host: '0.0.0.0')
