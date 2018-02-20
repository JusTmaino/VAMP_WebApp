# VAMP_WebAplication

## Tests et documentation de l'API

### Utilisation

LOGIN URL : POST to `http://localhost:8080/api/login`, 

Request Body must contrains a JSON DATA :  `{
	"username": "YourUsername",
	"password": "YourPassword"
}`

LOGOUT URL :  `http://localhost:8080/api/logout`

REGISTER URL : `http://localhost:8080/api/user/register`


GET RESSOURCES :

For Exemple get all Cars : POST to `http://localhost:8080/api/car.json` with 'X-Auth-Token' on header

The value of 'X-Auth-Token' is the access token u get from the login step

### Documentation

TODO
