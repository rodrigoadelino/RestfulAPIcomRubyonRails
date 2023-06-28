class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  # def author
  #   "Rodrigo Bonfim"
  # end

  meta do
    { author: "Rodrigo Bonfim"}
  end


  #Associates
  belongs_to :kind 
  has_many :phones  
  has_one :address


  def attributes(*args)
		h = super(*args)
		#h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) -PT-BR
		h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank? #Padrao de API
		h
	end
end
