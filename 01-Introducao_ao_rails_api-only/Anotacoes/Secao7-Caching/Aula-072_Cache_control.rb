## Para incluir o cache-control no rail em :notebook-api\app\controllers\v1\contacts_controller.rb
# GET /contacts
def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)
    @contacts = Contact.all.page(page_number).per(per_page) 
    expires_in 30.seconds, public: true  #Inclusao so cache control
    render json: @contacts
    end



### Deixar comentado 
# GET /contacts
def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)
    @contacts = Contact.all.page(page_number).per(per_page) 
    # # Cache-control
    # expires_in 30.seconds, public: true 
    render json: @contacts
    end    