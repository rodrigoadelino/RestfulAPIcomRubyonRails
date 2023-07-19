
# Solicitar uma media type com o Curl
curl http://127.0.0.1:3000/contacts/4 -H "Accept: application/json"

# Travar a aplicacao para responder somente application/json em:
class ApplicationController < ActionController::API

  before_filter :ensure_json_request

  def ensure_json_request
    return if request.headers["Accept"] =~ /json/
    render :nothing =>true, :status => 406
  end

end

# Testar pelo cURL
curl http://127.0.0.1:3000/contacts/4 


# Em: config/initializers/mime_types.rb
Mime::Type.register "application/vnd.api+json", :json



# Caso queira receber somente o que a especificacao informa em:
class ApplicationController < ActionController::API

  before_filter :ensure_json_request

  def ensure_json_request
    # return if request.headers["Accept"] =~ /json/
    return if request.headers["Accept"] =~ /vnd\.api\+json/    
    render :nothing =>true, :status => 406
  end

end
