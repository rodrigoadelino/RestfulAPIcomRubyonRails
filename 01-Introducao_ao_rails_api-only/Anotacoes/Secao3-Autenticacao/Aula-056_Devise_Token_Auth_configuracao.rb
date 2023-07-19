### Instalar a gem's 
gem 'devise'
gem 'devise_token_auth'

# rodar o comando abaixo
rails generate devise:install


# rodar o comando abaixo para gerar os arquivos necessarios do devise token auth
rails g devise_token_auth:install User auth

# rodar o deb:migrate
rails db:migrate

# Nao vamos usar autenticacao via rede social e nem confirmacao de email
# para isso vamos comentar os itens abaixo em:
:confirmable, :omniauthable



# Exigir autenticacao em notebook-api\app\controllers\kinds_controller.rb
# E comentar as linhas abaixo 
before_action :authenticate_user!

#include ActionController::HttpAuthentication::Token::ControllerMethods
#before_action :authenticate
# def authenticate
#     # authenticate_or_request_with_http_digest("Application") do |username|
#     #   USERS[username]
#     # end
#     authenticate_or_request_with_http_token do |token, option|
#     hmac_secret = 'my$ecretK3y'
#     JWT.decode token, hmac_secret, true, {:algorithm => 'HS256'}
#     #   ActiveSuport::SecurityUtils.secure_compare(
#     #     ::Digest::SHA256.hexdigest(token),
#     #     ::Digest::SHA256.hexdigest(TOKEN)
#     #   )
#     end
# end