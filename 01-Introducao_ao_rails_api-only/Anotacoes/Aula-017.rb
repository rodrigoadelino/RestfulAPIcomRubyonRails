## Associar o kind_id com o nome 

# Incluir a descricao do kind_id em notebook-api\app\models\contact.rb
def as_json(options={})
  super(
    root: true,
    methods: :author,
    include: :kind  # porem dessa forma ele traz aninhado
    )
end

# Somente a descricao aninhada
def as_json(options={})
  super(
    root: true,
    methods: :author,
    include: {kind: {only: :description}} # Somente a descricao
    )
end

# somente a descrição sem estar aninhada
class Contact < ApplicationRecord
	belongs_to :kind

	def author
		"Rodrigo Adelino"
	end

	def kind_description       # Cria o Method 
		self.kind.description
	end

	def as_json(options={})
		super(
			root: true,
			methods: [:kind_description, :author],  # Inclui o method criado
			)
	end
end
