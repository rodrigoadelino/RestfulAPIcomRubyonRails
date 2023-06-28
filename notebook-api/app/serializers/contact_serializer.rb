class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  def attributes(*args)
		h = super(*args)
		#h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?) -PT-BR
		h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank? #Padrao de API
		h
	end
end
