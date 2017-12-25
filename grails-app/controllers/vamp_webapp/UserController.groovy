package vamp_webapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class UserController {

    static allowedMethods = [save: "POST", update: ["PUT","POST"], delete: "DELETE"]

    def index(Integer max) {
        RestService rs = new RestService()
        rs.getUsers()
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

        if (!request.getFile('file').empty){
            def file = request.getFile('file')
            def type = file.contentType.toString()
            type = type.substring(type.indexOf("/")+1,type.length())

            def name = user.username.toString()
            user.image = new Image(path: name+'.'+type)
            file.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + '/users/'+ name+'.'+type))
        }

        user.save flush:true

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

        if (!request.getFile('file').empty){
            def file = request.getFile('file')
            def type = file.contentType.toString()
            type = type.substring(type.indexOf("/")+1,type.length())

            def name = user.username.toString()
            user.image = new Image(name: name+'.'+type)
            file.transferTo(new java.io.File(grailsApplication.config.server.uploadImage + '/users/'+ name+'.'+type))
        }

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
