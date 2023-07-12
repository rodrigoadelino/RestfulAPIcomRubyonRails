### Instalar a gem 
gem 'jwt'

### No rails c
hmac_secret = 'my$ecretK3y'
payload = {data: "Rodrigo Bonfim"}
token =JWT.encode payload, hmac_secret , 'HS256'  #Codificar o token

decode_token = JWT.decode token, hmac_secret, true, {:algorithm => 'HS256'} #Decodificar 