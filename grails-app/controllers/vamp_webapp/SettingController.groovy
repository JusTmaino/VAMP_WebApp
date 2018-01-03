package vamp_webapp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SettingController {

    static responseFormats = ['html', 'json']

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Setting.list(params), model:[settingCount: Setting.count()]
    }

    def show(Setting setting) {
        respond setting
    }

    def create() {
        respond new Setting(params)
    }

    @Transactional
    def save(Setting setting) {
        if (setting == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (setting.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond setting.errors, view:'create'
            return
        }

        setting.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'setting.label', default: 'Setting'), setting.id])
                redirect setting
            }
            '*' { respond setting, [status: CREATED] }
        }
    }

    def edit(Setting setting) {
        respond setting
    }

    @Transactional
    def update(Setting setting) {
        if (setting == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (setting.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond setting.errors, view:'edit'
            return
        }

        setting.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'setting.label', default: 'Setting'), setting.id])
                redirect setting
            }
            '*'{ respond setting, [status: OK] }
        }
    }

    @Transactional
    def delete(Setting setting) {

        if (setting == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        setting.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'setting.label', default: 'Setting'), setting.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'setting.label', default: 'Setting'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
