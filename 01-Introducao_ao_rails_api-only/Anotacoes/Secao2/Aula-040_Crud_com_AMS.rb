# POST http://127.0.0.1:3000/contacts/
{
	"data": {
			"type": "contacts",
			"attributes": {
					"name": "Rodrigo Bonfim",
					"email": "rodrigo@buckridge-herzog.example",
					"birthdate": "15/071989"
			},
			"relationships": {
					"kind": {
							"data": {
									"id": "2",
									"type": "kinds"
							}
					}
			}
	}
}

# PATCH http://127.0.0.1:3000/contacts/102
{
	"data": {
			"id": "102",  
			"type": "contacts",
			"attributes": {
					"name": "Rodrigo Adelino Bonfim",
					"email": "rodrigobonfim@buckridge-herzog.example",
					"birthdate": "15/071989"
			},
			"relationships": {
					"kind": {
							"data": {
									"id": "3",
									"type": "kinds"
							}
					}
			}
	}
}


# DELETE http://127.0.0.1:3000/contacts/102