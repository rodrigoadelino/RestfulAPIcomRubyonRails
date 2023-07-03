class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  #Associates
  belongs_to :kind  do
    link(:related) {contact_kind_url(object.id)}
  end
  has_many :phones  
  has_one :address


  # link(:self) {contact_path(object.id)}
  # link(:kind) {kind_path(object.kind.id)}

  # URL COMPLETA
  # link(:self) {contact_url(object.id)}          
  # link(:kind) {kind_url(object.kind.id)}
  
  # def author
  #   "Rodrigo Bonfim"
  # end

  meta do
    { author: "Rodrigo Bonfim"}
  end




  def attributes(*args)
		h = super(*args)
		#h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) -PT-BR
		h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank? #Padrao de API
		h
	end
end
