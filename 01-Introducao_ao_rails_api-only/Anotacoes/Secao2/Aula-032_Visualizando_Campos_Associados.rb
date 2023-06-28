## Incluir campos associados
# Como o kind é uma associacao belongs_to o memso nao traz o valor da chave em contatos 
# O method include: sera utilizado para o kind
# para as outras associacoes não se faz necessarios


# em:notebook-api\app\controllers\contacts_controller.rb
# GET /contacts/1
def show
render json: @contact, include: [:kind] #include: [:kind, :phones, :address]
end