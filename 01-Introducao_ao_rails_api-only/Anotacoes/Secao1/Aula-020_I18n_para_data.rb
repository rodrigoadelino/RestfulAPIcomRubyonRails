# Criar a funcao em: notebook-api\app\models\contact.rb
def birthdate_br
  I18n.l(self.birthdate) unless self.birthdate.blank?
end

# Chamar a funcao em: notebook-api\app\controllers\contacts_controller.rb
  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts, methods: [:birthdate_br]
  end


# Criar uma funcao to_br para retornar somente o que queremos em: notebook-api\app\models\contact.rb
def to_br
  {
    name: self.name, 
    email: self.email,
    birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  }
end


# chamar a funcao em: notebook-api\app\controllers\contacts_controller.rb
  # GET /contacts/1
  def show
    render json: @contact.to_br
  end
