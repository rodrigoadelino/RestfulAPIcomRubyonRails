# O to_br nao permite realizar o merge com o include foi removido em: notebook-api\app\controllers\contacts_controller.rb

  # GET /contacts/1
  def show
    render json: @contact #, include: :kind
  end

#  Subscrevemos o metodo as_json conforme abaixo em: notebook-api\app\models\contact.rb

def as_json(options={})
  h = super(options)
  h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
  h
end
