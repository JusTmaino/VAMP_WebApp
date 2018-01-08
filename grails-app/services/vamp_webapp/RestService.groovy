package vamp_webapp

import grails.gorm.transactions.Transactional
import grails.plugins.rest.client.RestBuilder
import groovy.json.JsonBuilder
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap

@Transactional
class RestService {

    /*********************************************  USERS  *******************************************************/
    def getUsers(boolean firstTime) {

        if (firstTime) {

            def restBuilder = new RestBuilder()
            def json = new JsonBuilder()

            def username = "amine";
            def password = "amine123456";
            json identifier: username, password: password

            def urlTemplate = "http://localhost:1337/auth/local"

            def resp = restBuilder.post(urlTemplate) {
                accept("application/json")
                contentType("application/json")
                body(json.toString())
            }
            System.out.println("Response status : " + resp.status + " Json : " + resp.json)

            if (resp.status == 200) {
                def url = "http://localhost:1337/user"

                def respUser = restBuilder.get(url) {
                    header('Authorization', 'Bearer ' + resp.json.token)
                }

                System.out.println("Response : " + respUser.json)

                (0..respUser.json.length() - 1).each {
                    int i ->
                        def userImage = new Image(path: 'user.jpg').save(Flush: true, failOnError: true);
                        def user = new User(username: respUser.json[i].username, password: respUser.json[i].username, fullName: 'amine elleuch', datenais: new Date(), tel: Integer.parseInt('21'), mail: respUser.json[i].email, image: userImage).save(Flush: true, failOnError: true);
                        def car = new Car(brand: 'BMW', model: 'Serie 1', matricule: 'RFHGF456', nb_place: 4, charge: 50, temperature_ext: 30).save(Flush: true, failOnError: true);
                        user.addToCars(car)
                        def profile = new Profile()
                        user.addToProfile(profile)
                        Role role = Role.findByAuthority('ROLE_USER');
                        UserRole.create(user, role, true)
                }
            }
        }



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
