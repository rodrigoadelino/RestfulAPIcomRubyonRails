### no IRB

# Criptografar com BASE64
require 'base64'
Base64.encode64('rodrigo:senha') # Coloca o enter no final \n
Base64.strict_encode64('rodrigo:senha') # Não coloca o enter no final \n


# Criptografar com MD5
require 'digest/md5'
Digest::MD5::hexdigest('rodrigo:senha')


# Fazer o login usando usuario e senha com o Curl 
curl http://localhost:3000/kinds -I -H 'Accept: application/json' -u rodrigo:secret -v
