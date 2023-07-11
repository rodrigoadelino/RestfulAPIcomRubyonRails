### TOken com Rails em notebook-api\app\controllers\kinds_controller.rb
TOKEN = "secret123"
include ActionController::HttpAuthentication::Token::ControllerMethods
before_action :authenticate
def authenticate
    # authenticate_or_request_with_http_digest("Application") do |username|
    #   USERS[username]
    # end
    authenticate_or_request_with_http_token do |token, option|
      ActiveSuport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(token),
        ::Digest::SHA256.hexdigest(TOKEN)
      )
    end
  end


  
#TESTE COM CURL
curl http://localhost:3000/contacts -H "Accept:application/vnd.api+json" -H "Authorization: Token secret123"