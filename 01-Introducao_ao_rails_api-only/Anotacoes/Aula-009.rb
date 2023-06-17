## Trazer o cabecalho Curl
curl http://127.0.0.1:3000/contacts -i
       
HTTP/1.1 200 OK                                     # Start-Line
X-Frame-Options: SAMEORIGIN                         # Header Fields
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
Vary: Accept
ETag: W/"b6ae25a7d26e23d9eea390b9ca2224e8"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 046443bc-c979-4365-81b1-0b45f6ea7bac
X-Runtime: 0.163060
Transfer-Encoding: chunked  
                                                    # Empty Line
[{"id":1,"name":"Jamey Fadel DDS",                  # Message-Body
    "email":"erich.welch@turner-effertz.test",
    "birthdate":"1975-04-10",
    "created_at":"2023-06-17T11:25:22.102Z",
    "updated_at":"2023-06-17T11:25:22.102Z"},
    {"id":2,"name":"
]Tamesha Botsford","email":"francis@watsica-wa