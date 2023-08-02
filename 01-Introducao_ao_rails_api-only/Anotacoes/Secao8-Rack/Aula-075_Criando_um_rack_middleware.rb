## Adicionando a pasta "lib" em: notebook-api\config\application.rb
config.autoload_paths << Rails.root.join('lib')


## criar um rack em: notebook-api\lib\app_name.rb
class AppName
	def initialize(app)
		@app = app
	end
	def call(env)
		status, headers, response = @app.call(env)
		headers.merge!({'X-App-Name' => 'Notebook API'})
		[status, headers, [response.body]]
	end
end


### Incluir a linha abaixo em notebook-api\config\initializers\cors.rb
unless Rails.env.test?
  Rails.application.config.middleware.use AppName
end