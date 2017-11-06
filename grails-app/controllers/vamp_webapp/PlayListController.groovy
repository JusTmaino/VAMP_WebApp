package vamp_webapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PlayListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PlayList.list(params), model:[playListCount: PlayList.count()]
    }

    def show(PlayList playList) {
        respond playList
    }

    def create() {
        respond new PlayList(params)
    }

    @Transactional
    def save(PlayList playList) {
        if (playList == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (playList.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond playList.errors, view:'create'
            return
        }

        playList.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'playList.label', default: 'PlayList'), playList.id])
                redirect playList
            }
            '*' { respond playList, [status: CREATED] }
        }
    }

    def edit(PlayList playList) {
        respond playList
    }

    @Transactional
    def update(PlayList playList) {
        if (playList == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (playList.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond playList.errors, view:'edit'
            return
        }

        playList.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'playList.label', default: 'PlayList'), playList.id])
                redirect playList
            }
            '*'{ respond playList, [status: OK] }
        }
    }

    @Transactional
    def delete(PlayList playList) {

        if (playList == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        playList.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'playList.label', default: 'PlayList'), playList.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'playList.label', default: 'PlayList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
