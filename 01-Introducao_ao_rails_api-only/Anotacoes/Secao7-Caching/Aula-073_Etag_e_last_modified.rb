## Incluir a verificacao da Etag em: notebook-api\app\controllers\v1\contacts_controller.rb
# GET /contacts
def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)
    @contacts = Contact.all.page(page_number).per(per_page) 
    # # Cache-control
    # expires_in 30.seconds, public: true 
    if stale?(etag: @contacts)
        render json: @contacts
    end
end


### Pegar a etag que vem no headers do postam e renviar como:
if-None-Match :  "Etag"


## Incluir a verificacao da Etag em: notebook-api\app\controllers\v1\contacts_controller.rb 
# GET /contacts
def index
    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)
    @contacts = Contact.all.page(page_number).per(per_page) 
    # # Cache-control
    # expires_in 30.seconds, public: true 
    # if stale?(etag: @contacts)
    #   render json: @contacts
    # end
    #Last Modifield
    if stale?(last_modified: @contacts[0].updated_at)
        render json: @contacts
    end
end


### Pegar a Last-Modified que vem no header e passa com oparametro em 
If-Modified-Since:  "Last-Modified"