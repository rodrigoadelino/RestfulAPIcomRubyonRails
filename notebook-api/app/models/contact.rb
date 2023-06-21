class Contact < ApplicationRecord
	belongs_to :kind

	def author
		"Rodrigo Adelino"
	end

	def as_json(options={})
		super(methods: :author, root: true)
	end
end
