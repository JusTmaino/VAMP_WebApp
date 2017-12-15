package vamp_webapp

import grails.gorm.transactions.Transactional
import grails.plugins.rest.client.RestBuilder

@Transactional
class RestService {

    /*********************************************  USERS  *******************************************************/
    def getUsers() {

        def urlTemplate = "http://localhost:1337/user"

        def resp = new RestBuilder().get(urlTemplate) {
            //auth username, password
        }
        System.out.println(resp.json)
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
