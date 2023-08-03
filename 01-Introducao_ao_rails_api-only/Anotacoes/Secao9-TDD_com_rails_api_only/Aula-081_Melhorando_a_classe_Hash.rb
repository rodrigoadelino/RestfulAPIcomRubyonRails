### Incluindo a parte d ecodigo abaixo em: notebook-api\spec\spec\controllers\v1\contacts_spec.rb 
class Hash
	def json(parts)
		ary = parts.split(">")
		ary.reduce(self) do |memo, key|
			memo.fetch(key.to_s.strip) if memo
		end
	end
end


### melhorando o codigo em: notebook-api\spec\spec\controllers\v1\contacts_spec.rb 
expect(response_body.json('data > id')).to eq(contact.id.to_s)
expect(response_body.json('data > type')).to eq('contacts')
expect(response_body.json('data > attributes > name')).to eq(contact.name)
