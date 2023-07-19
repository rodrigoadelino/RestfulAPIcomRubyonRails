## por padrao quando criamos o CRUD/Scanffold foi criado em "notebook-api\config\routes.rb" os recursos padrao para contacts
Rails.application.routes.draw do
    resources :contacts
  end


#### É possivel criar apenas com os recursos que queremos exemplo abaixo somente para um get para index:
Rails.application.routes.draw do
    get '/contacts', to: "contacts#index"
  end