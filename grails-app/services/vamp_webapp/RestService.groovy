package vamp_webapp

import grails.gorm.transactions.Transactional
import grails.plugins.rest.client.RestBuilder
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap

@Transactional
class RestService {

    /*********************************************  USERS  *******************************************************/
    def getUsers() {

        def username = 'utilisateur2@gmail.com';
        def password = 'utilisateur2';

        def urllogin = "http://localhost:1337/user/login?email={email}&password={password}"
        def params = [email: username, password:password]

        def resplogin = new RestBuilder().get(urllogin,params) {

        }
        System.out.println("Response ON Login : "+resplogin.json)



        /*def urlTemplate = "http://localhost:1337/user/login"

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
        form.add("grant_type", "password")
        form.add("email", username)
        form.add("password", password)

        def resp = new RestBuilder().get(urlTemplate) {
            //auth username, password
            accept("application/json")
            contentType("application/x-www-form-urlencoded")
            body(form)
        }
        System.out.println("Response : "+resp.json)*/
    }

    def getUser(String idUser) {

        def urlTemplate = "http://localhost:1337/user/{id}"
        def params = [id: idUser]

        def resp = new RestBuilder().get(urlTemplate ,params) {
            //auth username, password
        }
        System.out.println(resp.json)
    }

    def addtUser(String username ,String password ,String fullName ,Date datenais ,Integer tel ,String mail) {

        def urlTemplate = "http://localhost:1337/user"
        def params = [username: username, password: password, fullName: fullName, datenais: datenais, tel: tel, mail: mail]

        def resp = new RestBuilder().post(urlTemplate ,params) {
            //auth username, password
        }
        System.out.println(resp.json)
    }

    def updateUser(String idUser) {

        def urlTemplate = "http://localhost:1337/user/{id}"
        def params = [id: idUser]

        def resp = new RestBuilder().put(urlTemplate ,params) {
            //auth username, password
        }
        System.out.println(resp.json)
    }

    def deleteUser(String idUser) {

        def urlTemplate = "http://localhost:1337/user/{id}"
        def params = [id: idUser]

        def resp = new RestBuilder().delete(urlTemplate ,params) {
            //auth username, password
        }
        System.out.println(resp.json)
    }

    /*********************************************  CARS  *******************************************************/



    /*********************************************  IMAGES  *****************************************************/



    /*********************************************  LOCATIONS  **************************************************/



    /*********************************************  MEDIA  ******************************************************/



    /*********************************************  PLAYLISTS  **************************************************/



    /*********************************************  PROFILE  ****************************************************/



    /*********************************************  SETTINGS  ***************************************************/


}
