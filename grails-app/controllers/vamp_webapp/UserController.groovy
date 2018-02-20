package vamp_webapp

import grails.plugins.rest.client.RestBuilder

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class UserController {

    static responseFormats = ['html', 'json']

    static allowedMethods = [save: "POST", update: ["PUT","POST"], delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userCount: User.count()]
    }

    def show(User user) {
        respond user
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {
        println('Saving...')
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'create'
            return
        }

        /*if (!request.getFile('file').empty){
            def file = request.getFile('file')
            def type = file.contentType.toString()
            type = type.substring(type.indexOf("/")+1,type.length())

            def name = user.username.toString()
            user.image = new Image(path: name+'.'+type)
            file.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + '/users/'+ name+'.'+type))
        }*/

        user.save flush:true

        System.out.println("params : " + params)

        if( params.roleID != null ) {
            Role newRole = Role.findById(params.roleID);
            UserRole.create(user, newRole, true)

        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(User user) {
        respond user
    }

    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        /*if (!request.getFile('file').empty){
            def file = request.getFile('file')
            def type = file.contentType.toString()
            type = type.substring(type.indexOf("/")+1,type.length())

            def name = user.username.toString()
            user.image = new Image(name: name+'.'+type)
            file.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + '/users/'+ name+'.'+type))
        }*/

        System.out.println("params : " + params)

        if( (params.roleID != null) && (UserRole.findByUser(user).role != null) ) {
            Role removedRole = Role.findById(UserRole.findByUser(user).role.id);
            UserRole.remove(user, removedRole)
            Role newRole = Role.findById(params.roleID);
            UserRole.create(user, newRole, true)

        }

        user.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Role removedRole=Role.findById(UserRole.findByUser(user).role.id);
        UserRole.remove (user, removedRole)

        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Transactional
    def register(User user) {
        System.out.println("Registering....")
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            redirect(controller: 'login', action:'register' ,params: [error: "User Already Exist !!!"])
            return
        }

        System.out.println("params : "+params)
        System.out.println("User : "+user)

        user.save flush:true
        Role role=Role.findByAuthority('ROLE_USER');
        UserRole.create (user, role, true)

        redirect(controller: 'login', action:'auth')

    }


    def registerFromAuth() {
        println('registerFromAuth...')
        println('params : '+ params)

        def restBuilder = new RestBuilder()

        def url = "http://localhost:1337/user/{id}"
        def param = [id: params.user_id]

        def respUser = restBuilder.get(url , param) {
            header('Authorization', 'Bearer ' + params.token)
        }

        println("response : "+respUser.text)

        def userImage = new Image(path: 'user.jpg').save(Flush: true, failOnError: true);
        def user = new User(username: params.username, password: params.password, fullName: 'amine elleuch' , datenais: new Date(), tel: Integer.parseInt('21') , mail:respUser.json.email, image: userImage).save(Flush: true, failOnError: true);
        def car = new Car( brand : 'BMW', model : 'Serie 1', matricule : 'RFHGF456', nb_place : 4, charge : 50, temperature_ext : 30).save(Flush: true, failOnError: true);
        user.addToCars(car)
        def profile = new Profile()
        user.addToProfile(profile)
        Role role=Role.findByAuthority('ROLE_USER');
        UserRole.create (user, role, true)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
