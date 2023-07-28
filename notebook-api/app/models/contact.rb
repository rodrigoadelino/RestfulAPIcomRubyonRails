class Contact < ApplicationRecord

	#Validations
	validates_presence_of :kind
	validates_presence_of :address

	#Kaminari
	paginates_per 5

	# Associates
	belongs_to :kind #, optional: true
	has_many :phones  #Possui muitos telefones
	has_one :address


	accepts_nested_attributes_for :phones, allow_destroy: true #Atraves de um contato apagar um telefone
	accepts_nested_attributes_for :address, update_only: true # update_only: true permite atualizar e nao cadastra outro

	def as_json(options={})
		h = super(options)
		h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
		h
	end

	# def birthdate_br
	# 	I18n.l(self.birthdate) unless self.birthdate.blank?
	# end

	# def to_br
	# 	{
	# 		name: self.name, 
	# 		email: self.email,
	# 		birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
	# 	}
	# end


	# def author
	# 	"Rodrigo Adelino"
	# end

	# def kind_description
	# 	self.kind.description
	# end

	# def as_json(options={})
	# 	super(
	# 		root: true,
	# 		methods: [:kind_description, :author],
	# 		# include: {kind: {only: :description}}
	# 		)
	# end

	# def hello
	# 	I18n.t('hello')
	# end
	# def i18n
	# 	I18n.default_locale
	# end
end
 