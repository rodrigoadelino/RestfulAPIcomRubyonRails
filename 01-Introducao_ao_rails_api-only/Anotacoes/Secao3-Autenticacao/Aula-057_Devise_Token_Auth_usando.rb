### cadstrar um usuario pelo postman
POST | localhost:3000/auth/
{
  "email": "rodrigo@bonfim.com.br",
  "password": "12345678",
  "passord_confirmation":"12345678"
}


### Fazer login
POST | localhost:3000/auth/sign_in
{
  "email": "rodrigo@bonfim.com.br",
  "password": "12345678"
}

### Instalar a gem  para traduzir erros comuns
gem 'devise-i18n'


### Acessar um conteudo protegido
GET | localhost:3000/kinds
# terá que passar os dados abaixo no header da reuisicao
access-token
client
uid