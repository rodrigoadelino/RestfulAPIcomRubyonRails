### gerar um controller
rails g controller auths

# criar a rota create para o auths em: notebook-api\config\routes.rb
Rails.application.routes.draw do
    resources :auths, only: [:create]

# Criar a action create na controller em: notebook-api\app\controllers\auths_controller.rb
class AuthsController < ApplicationController
    def create
        hmac_secret = 'my$ecretK3y'
        payload = {name: params[:name]}
        token =JWT.encode payload, hmac_secret , 'HS256'
        render json {token: token} 
    end
end

# Barrar o acesso ao Kinds com o Token
def authenticate
    authenticate_or_request_with_http_token do |token, option|
      hmac_secret = 'my$ecretK3y'
      JWT.decode token, hmac_secret, true, {:algorithm => 'HS256'}
    end
  end

# Colocar um tempo para expirar o token: notebook-api\app\controllers\auths_controller.rb
class AuthsController < ApplicationController
    def create
        hmac_secret = 'my$ecretK3y'
        payload = {name: params[:name], exp: Time.now.to_i + 30 } #Aqui foi colocado a expiracao do token
        token =JWT.encode payload, hmac_secret , 'HS256'
        render json {token: token} 
    end
end