## verbo POST no Curl
curl http://127.0.0.1:3000/contacts -i -v -X POST -H "Content-Type: application/json" -d "{\"name\":\"Rodrigo\",\"email\":\"rodrigo@bonfim.com.br\"}"


# pegando um registro especifico pelo ID
curl http://127.0.0.1:3000/contacts/101


# PATCH vs PUT
# O PUT precisar atualizar todos os elementos do recurso
# Já o Patch consegue atualizar apenas um elemento


# Atualizado com o PATCH
curl http://127.0.0.1:3000/contacts/101 -i -v -X PATCH -H "Content-Type: application/json" -d "{\"name\":\"Rodrigo Bonfim\",\"email\":\"rodrigo@bonfim.com.br\"}"


# Deletar um item do recurso
curl http://127.0.0.1:3000/contacts/101 -i -v -X DELETE