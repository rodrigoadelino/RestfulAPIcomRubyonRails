### Criando uma logica para necessitar o Accept-Content em requisicoes POST em notebook-api\app\controllers\application_controller.rb
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :ensure_json_request

  def ensure_json_request
    unless request.headers["Accept"] =~ /json/
      #return if request.headers["Accept"] =~ /vnd\.api\+json/    
      render :nothing => true, :status => 406
    else
      unless request.get?
        return if request.headers["Content-Type"] =~ /json/  
        render :nothing => true, :status => 415
      end
    end
  end

end



### TESTE NO POSTMAN PARA POST 
POST | localhost:3000/v1/contacts
#Headers
Accept : application/json
Content-Type : application/json