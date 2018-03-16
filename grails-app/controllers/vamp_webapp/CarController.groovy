package vamp_webapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import vamp_webapp.User

@Transactional(readOnly = true)
class CarController {

    static responseFormats = ['html', 'json']


    static allowedMethods = [save: "POST", update: ["PUT","POST"], delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Car.list(params), model:[carCount: Car.count()]
    }

    def show(Car car) {
        respond car
    }

    def create() {
        respond new Car(params)
    }

    @Transactional
    def save(Car car) {
        if (car == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (car.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond car.errors, view:'create'
            return
        }


        request.getMultiFileMap().files.each {
            def name = it.originalFilename
            car.addToImages(new Image(path: name))
            it.transferTo(new java.io.File(grailsApplication.config.server.uploadImage +'cars/'+ name))
        }

        car.save flush:true
        User.findById(sec.loggedInUserInfo(field: 'id')).addToCars(car).save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'car.label', default: 'Car'), car.id])
                redirect car
            }
            '*' { respond car, [status: CREATED] }
        }
    }

    def edit(Car car) {
        respond car
    }

    @Transactional
    def update(Car car) {
        if (car == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (car.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond car.errors, view:'edit'
            return
        }

        request.getMultiFileMap().files.each {
            def name = it.originalFilename
            car.addToImages(new Image(path: name))
            it.transferTo(new java.io.File(grailsApplication.config.server.uploadImage +'cars/'+ name))
        }

        car.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'car.label', default: 'Car'), car.id])
                redirect car
            }
            '*'{ respond car, [status: OK] }
        }
    }

    @Transactional
    def delete(Car car) {

        if (car == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        List<User> users = User.getAll()
        (0..users.size() - 1).each {
            int i ->
                //User user = User.findById(users[i].id);
                Set<Car> cars = users[i].getCars()
                if(cars!= null) {
                    (0..cars.size() - 1).each {
                        int j ->
                            //Car voiture = Car.findById(cars[j].id)
                            if (cars[j] == car) {
                                Set<Image> images = car.getImages()
                                (0..images.size() - 1).each {
                                    int k ->
                                        //cars[j].removeFromImages(images[k])
                                        images[k].delete flush: true
                                }
                                users[i].removeFromCars(cars[j])
                                car.delete flush:true
                            }
                    }
                }
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'car.label', default: 'Car'), car.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
