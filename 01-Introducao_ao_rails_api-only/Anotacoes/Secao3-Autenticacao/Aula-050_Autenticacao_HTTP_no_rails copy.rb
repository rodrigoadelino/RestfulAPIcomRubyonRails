### Colocar autenticacao http bascic em: notebook-api\app\controllers\kinds_controller.rb
include ActionController::HttpAuthentication::Basic::ControllerMethods
http_basic_authenticate_with name: "rodrigo", password: "secret"


### Colocar autenticacao http bascic (Digest) em notebook-api\app\controllers\kinds_controller.rb
include ActionController::HttpAuthentication::Digest::ControllerMethods
USERS = {"rodrigo" => Digest::MD5.hexdigest(["rodrigo","Application","secret"].join(":"))}

before_action :authenticate


def authenticate
  authenticate_or_request_with_http_digest("Application") do |username|
    USERS[username]
  end
end
