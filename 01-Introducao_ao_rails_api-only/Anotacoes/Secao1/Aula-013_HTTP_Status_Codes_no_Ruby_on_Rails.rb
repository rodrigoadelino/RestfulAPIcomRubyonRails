## Alterar um status code em notebook-api\app\controllers\contacts_controller.rb


# GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts, status: :partial_content
  end

