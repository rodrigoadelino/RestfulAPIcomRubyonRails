class AuthsController < ApplicationController
    def create
        hmac_secret = 'my$ecretK3y'
        payload = {name: params[:name], exp: Time.now.to_i + 30 } #Aqui foi colocado a expiracao do token
        token = JWT.encode payload, hmac_secret , 'HS256'
        render json: {token: token} 
    end
end
